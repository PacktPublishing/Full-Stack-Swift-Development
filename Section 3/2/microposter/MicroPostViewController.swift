//
//  MicroPostViewController.swift
//  microposter
//
//  Created by Johann Kerr on 6/24/18.
//  Copyright © 2018 Johann Kerr. All rights reserved.
//

import UIKit

class MicroPostViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var posts = [["content":"iOS rocks", "author":"johann"], ["content":"Swift is the best", "author":"johann"]]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchPosts()
        self.tableView.dataSource = self

    }
    
    func fetchPosts() {
        let urlString = "http://localhost:8080/posts"
        let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
        if let url = URL(string: urlString) {
            let task = session.dataTask(with: url) { (data, response, error) in
                print(response)
                
                if let responseData = data {
                    
                    do {
                        let jsonObject = try JSONSerialization.jsonObject(with: responseData, options: []) as? [[String: Any]]
                        
                        if let jsonArray = jsonObject {
                            print(jsonArray)
//                            self.posts = jsonArray
                        }
                        
                    } catch {
                        
                    }
                    
                    
                }
            }
            
            task.resume()
            
        }
    
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
