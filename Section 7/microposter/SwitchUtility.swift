//
//  SwitchUtility.swift
//  microposter
//
//  Created by Johann Kerr on 7/16/18.
//  Copyright © 2018 Johann Kerr. All rights reserved.
//

import Foundation
import UIKit

class SwitchUtility {
    static func updateVC() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        let rootVC: UIViewController
        if let token = UserDefaults.standard.string(forKey: "token") {
            
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabBarVC")
        } else {
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC")
            
        }
        
        appDelegate.window?.rootViewController = rootVC
        
        
        
    }
}
