//
//  MicroPostDetailViewController.swift
//  microposter
//
//  Created by Johann Kerr on 6/24/18.
//  Copyright © 2018 Johann Kerr. All rights reserved.
//

import UIKit

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



}
