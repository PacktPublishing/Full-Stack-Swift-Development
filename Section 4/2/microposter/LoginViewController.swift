//
//  LoginViewController.swift
//  microposter
//
//  Created by Johann Kerr on 7/10/18.
//  Copyright © 2018 Johann Kerr. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        print("username", usernameTextField.text!, "password", passwordTextField.text!)
    }
    

}
