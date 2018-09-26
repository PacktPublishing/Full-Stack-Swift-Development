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
        
        if let username = usernameTextField.text, let password = passwordTextField.text {
            loginUser(username: username, password: password)
            
        
        }
    }
    
    func loginUser(username: String, password: String) {
        let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
        if let url = URL(string:"http://localhost:8080/users/login") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            let loginString = "\(username):\(password)"
            if let loginData = loginString.data(using: .utf8) {
                let encodedString = loginData.base64EncodedString()
                print(encodedString)
                
                request.addValue("Basic \(encodedString)", forHTTPHeaderField: "Authorization")
                
                let task = session.dataTask(with: request) { (data, response, error) in
                    
                    if let resData = data {
                        do {
                            let jsonData = try JSONSerialization.jsonObject(with: resData, options: [])
                            print(jsonData)
                        } catch {
                            
                        }
                    }
                    
                }
                task.resume()
            }
            
            
            
        }
    }
    

}

