//
//  SignUpViewController.swift
//  microposter
//
//  Created by Johann Kerr on 7/10/18.
//  Copyright © 2018 Johann Kerr. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func signUpUser(username: String, password: String) {
        let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
        if let url = URL(string: "http://micropostr-app.herokuapp.com/users") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            let loginDict = ["username":username, "password":password]
            
            do {
                let loginData = try JSONSerialization.data(withJSONObject: loginDict, options: [])
                urlRequest.httpBody = loginData
                urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                
                let task = session.dataTask(with: urlRequest) { (data, response, error) in
                    if let resData = data {
                        do {
                            let jsonData = try JSONSerialization.jsonObject(with: resData, options: []) as! [String: String]
                            print(jsonData)
                        } catch {
                            
                        }
                        
                    }
                    
                    
                }
                task.resume()
                
                
                
            } catch {
                
            }
        }
        
        
        
    }

    @IBAction func signUpBtnPressed(_ sender: Any) {
        print("username", usernameTextField.text!, "password", passwordTextField.text!)
        
        if let username = usernameTextField.text, let password = passwordTextField.text {
            self.signUpUser(username: username, password: password)
        }
        
    }
    
}
