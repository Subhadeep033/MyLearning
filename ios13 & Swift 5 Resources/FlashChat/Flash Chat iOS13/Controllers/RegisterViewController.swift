//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    var registerModel = RegisterModel()
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if registerModel.isRegistrationDetailsValidated(emailTextfield.text, passwordTextfield.text).0 == false{
            print(registerModel.isRegistrationDetailsValidated(emailTextfield.text, passwordTextfield.text).1)
        }
        else{
            registerInFireBase(with: emailTextfield.text ?? "", password: passwordTextfield.text ?? "")
        }
    }
    
    func registerInFireBase(with email:String,password:String){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil{
                print("Error",error!.localizedDescription)
            }
            else{
                print(authResult!)
                self.performSegue(withIdentifier: Constants.registerSegue, sender: self)
            }
        }
    }
}
