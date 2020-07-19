//
//  ViewController.swift
//  CoreMLChat
//
//  Created by DAPL-Asset-290 on 21/02/20.
//  Copyright © 2020 DAPL-Asset-290. All rights reserved.
//

import UIKit
import CoreML
import NaturalLanguage

class ChatCell : UITableViewCell{
    @IBOutlet weak var AIMessageLabel: UILabel!
    @IBOutlet weak var userMessageLabel: UILabel!
}

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var chatTextBox: UITextField!
    @IBOutlet weak var chatTableView: UITableView!
    var chatArr = [[String : Any]]()
    var textModel : Mutual!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.textModel = Mutual()
    }
    
    @IBAction func sendButtonAction(_ sender: Any) {
        chatTextBox.resignFirstResponder()
        if chatTextBox.text != ""{
            let dict = ["message" : chatTextBox.text ?? "", "isUserMessage" : true] as [String : Any]
            chatArr.append(dict)
            chatTableView.reloadData()
            self.AIReplyMessage(userText: chatTextBox.text ?? "")
            chatTextBox.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        chatTextBox.resignFirstResponder()
        return true
    }
    
    func AIReplyMessage(userText : String)  {
        guard let prediction = try? textModel.prediction(text: userText) else {
            return
        }
        debugPrint(prediction.label)
        let dict = ["message" : prediction.label , "isUserMessage" : false] as [String : Any]
        chatArr.append(dict)
        chatTableView.reloadData()
    }
    
}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatCell : ChatCell = tableView.dequeueReusableCell(withIdentifier: "chatCell") as! ChatCell
        let dict = chatArr[indexPath.row]
        
        if dict["isUserMessage"] as? Bool ?? false == true{
            chatCell.userMessageLabel.text = dict["message"] as? String ?? ""
            chatCell.AIMessageLabel.text = ""
        }
        else{
            chatCell.AIMessageLabel.text = dict["message"] as? String ?? ""
            chatCell.userMessageLabel.text = ""
        }
        return chatCell
    }
    
    
}

