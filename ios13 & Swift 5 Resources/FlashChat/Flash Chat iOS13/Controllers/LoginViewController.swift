//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var registerModel = RegisterModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if registerModel.isRegistrationDetailsValidated(emailTextfield.text, passwordTextfield.text).0 == false{
            print(registerModel.isRegistrationDetailsValidated(emailTextfield.text, passwordTextfield.text).1)
        }
        else{
            loginToFireBase(with: emailTextfield.text ?? "", password: passwordTextfield.text ?? "")
        }
        
    }
    
    func loginToFireBase(with email:String,password : String){
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e.localizedDescription)
            }
            else{
                self.performSegue(withIdentifier: Constants.loginSegue, sender: self)
            }
        }
    }
    
}
