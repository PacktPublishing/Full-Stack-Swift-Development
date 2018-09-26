//
//  MicroPostDetailViewController.swift
//  microposter
//
//  Created by Johann Kerr on 6/24/18.
//  Copyright © 2018 Johann Kerr. All rights reserved.
//

import UIKit
import CoreData
class MicroPostDetailViewController: UIViewController {
    var content: String = ""
    
    @IBOutlet weak var contentlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentlabel.text = content
        print("DidLoad - MicroPostDetail")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("WillAppear - MicroPostDetail")
    }


    @IBAction func saveButtonPressed(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let savedPost = SavedPost(context: context)
        savedPost.content = self.content
        context.insert(savedPost)
        appDelegate.saveContext()
        
    }
    
}
