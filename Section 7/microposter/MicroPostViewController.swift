//
//  MicroPostViewController.swift
//  microposter
//
//  Created by Johann Kerr on 6/24/18.
//  Copyright © 2018 Johann Kerr. All rights reserved.
//

import UIKit
import Alamofire

class MicroPostViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var posts: [Post] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchPosts { (posts) in
           
            self.posts = posts
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        self.altFetchPosts { (posts) in
            print("FROM ALT", posts)
        }
        self.tableView.dataSource = self

    }
    
    func altFetchPosts(callback:@escaping ([Post]) -> ()) {

        if let token = UserDefaults.standard.string(forKey: "token") {
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(token)",
                "Accept": "application/json"
            ]
            Alamofire.request("http://micropostr-app.herokuapp.com/users/posts", headers: headers).responseData { (resData) in
                
                do {
                    
                    if let data = resData.data {
                        let decoder = JSONDecoder()
                        let posts = try decoder.decode([Post].self, from: data)
                         callback(posts)
                    }
                    
                } catch {
                    
                }
                
                
                
            }
        }
        
        
    }
    
    func fetchPosts(callback:@escaping ([Post]) -> ()) {
        let urlString = "http://micropostr-app.herokuapp.com/users/posts"
        if let token = UserDefaults.standard.string(forKey: "token") {
            let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
            if let url = URL(string: urlString) {
                var urlRequest = URLRequest(url: url)
                urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                let task = session.dataTask(with: urlRequest) { (data, response, error) in
                    
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
