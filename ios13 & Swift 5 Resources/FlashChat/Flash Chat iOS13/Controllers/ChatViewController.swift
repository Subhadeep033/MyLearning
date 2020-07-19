//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    let db = Firestore.firestore()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        navigationItem.title = Constants.appName
        navigationItem.hidesBackButton = true
        loadMessages()
    }
    
    func loadMessages(){
        db.collection(Constants.FStore.collectionName).order(by: Constants.FStore.dateField).addSnapshotListener { (querySnapshot, err) in
            self.messages.removeAll()
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                if let documents = querySnapshot?.documents{
                    for docs in documents{
                        let data = docs.data()
                        
                        if let sender = data[Constants.FStore.senderField] as? String, let message = data[Constants.FStore.bodyField] as? String{
                            
                            let message = Message(sender: sender, body: message)
                            self.messages.append(message)
                        }
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                        self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        messageTextfield.resignFirstResponder()
        
        if let messageBody = messageTextfield.text, let senderId = Auth.auth().currentUser?.email, messageTextfield.text != ""{
            // Add a new document with a generated ID
            var ref: DocumentReference? = nil
            ref = db.collection(Constants.FStore.collectionName).addDocument(data: [
                Constants.FStore.senderField : senderId,
                Constants.FStore.bodyField : messageBody,
                Constants.FStore.dateField : Date().timeIntervalSince1970
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""
                    }
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        }
    }
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem){
        let fireAuth = Auth.auth()
        do{
            try fireAuth.signOut()
            self.navigationController?.popToRootViewController(animated: true)
        }catch let signOutError as NSError{
            print("Error:",signOutError.localizedDescription)
        }
    }
}

extension ChatViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(messages.count)
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentMessage = messages[indexPath.row]
        if currentMessage.sender == Auth.auth().currentUser?.email {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.toCellIdentifier, for: indexPath) as! MyChatCell
            cell.messageLabel.text = messages[indexPath.row].body
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.fromCellIdentifier, for: indexPath) as! YourChatCell
            cell.messageLabel.text = messages[indexPath.row].body
            return cell
        }
        
    }
}
