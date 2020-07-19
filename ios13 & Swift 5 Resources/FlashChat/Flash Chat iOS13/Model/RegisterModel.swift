//
//  RegisterModel.swift
//  Flash Chat iOS13
//
//  Created by DAPL-Asset-290 on 25/06/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation

struct RegisterModel {
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isRegistrationDetailsValidated(_ email: String?, _ password: String?) -> (Bool, String){
        if let emailText = email, let passwordText = password {
            if emailText != "" && passwordText != ""{
                if isValidEmail(emailText){
                    if passwordText.count >= 6{
                        return (true, "")
                    }
                    else{
                        return(false, "Password must have six characters.")
                    }
                }
                else{
                    return(false, "Email Validation Failed.")
                }
                
            }
            else{
                return(false,"Please Enter Details.")
            }
           
        }
        else{
            return(false,"Please Enter Details.")
        }
    }
}
