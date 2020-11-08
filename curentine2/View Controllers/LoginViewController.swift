//
//  LoginViewController.swift
//  curentine2
//
//  Created by Dhruv Rastogi on 05/09/20.
//  Copyright © 2020 Dhruv Rastogi. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    func setUpElements()
    {
        //Hide the error label
        errorLabel.alpha = 0
        
        //Style the elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }

    
    
    @IBAction func loginTapped(_ sender: Any) {
        
        // Validate Text Fields
        
        // Create cleaned versions of the text fields
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the User
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                //couldn't signin
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            
            else {
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
        
    }
    
}
