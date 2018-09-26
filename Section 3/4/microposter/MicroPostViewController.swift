//
//  MicroPostViewController.swift
//  microposter
//
//  Created by Johann Kerr on 6/24/18.
//  Copyright © 2018 Johann Kerr. All rights reserved.
//

import UIKit

class MicroPostViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var posts: [Post] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchPosts { (posts) in
            print(posts)
            self.posts = posts
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        self.tableView.dataSource = self

    }
    
    func fetchPosts(callback:@escaping ([Post]) -> ()) {
        let urlString = "http://localhost:8080/posts"
        let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
        if let url = URL(string: urlString) {
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if let responseData = data {
                    
                    do {
                        
                        let decoder = JSONDecoder()
                        let posts = try decoder.decode([Post].self, from: responseData)
                        
                        callback(posts)
                       
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
        cell.contentLabel.text = post.content
        cell.authorLabel.text = "Author \(post.authorID)"
        cell.dateLabel.text = "Today"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "micropostDetail" {
            let micropostDetailVC = segue.destination as! MicroPostDetailViewController
            if let rowIndex = self.tableView.indexPathForSelectedRow?.row {
                let post = self.posts[rowIndex]
               
                micropostDetailVC.content = post.content

            }
        }
    }
    

}
