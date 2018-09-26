//
//  MicroPostViewController.swift
//  microposter
//
//  Created by Johann Kerr on 6/24/18.
//  Copyright © 2018 Johann Kerr. All rights reserved.
//

import UIKit

class MicroPostViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let posts = [["content":"iOS rocks", "author":"johann"], ["content":"Swift is the best", "author":"johann"]]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self

        print("ViewDidLoad MicroPostView")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewWillAppear MicroPostView")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewWillDisappear - MicroPostView")
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "micropostCell", for: indexPath) as! MicroPostCell
        
        
        let post = posts[indexPath.row]
        cell.contentLabel.text = post["content"]
        cell.authorLabel.text = post["author"]
        cell.dateLabel.text = "Today"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "micropostDetail" {
            let micropostDetailVC = segue.destination as! MicroPostDetailViewController
            if let rowIndex = self.tableView.indexPathForSelectedRow?.row {
                let post = self.posts[rowIndex]
                if let content = post["content"] {
                    micropostDetailVC.content = content
                }
            }
        }
    }
    

}
