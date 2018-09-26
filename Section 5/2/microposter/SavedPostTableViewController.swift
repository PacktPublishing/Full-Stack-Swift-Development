//
//  SavedPostTableViewController.swift
//  microposter
//
//  Created by Johann Kerr on 8/13/18.
//  Copyright © 2018 Johann Kerr. All rights reserved.
//

import UIKit

class SavedPostTableViewController: UITableViewController {

    var savedPosts = [SavedPost]()
    var store = Datastore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchPosts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchPosts()
    }
    
    func fetchPosts() {
        store.fetchPosts { (posts) in
            self.savedPosts = posts
            self.tableView.reloadData()
        }
        
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.savedPosts.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedPostCell", for: indexPath)

        let post = self.savedPosts[indexPath.row]

        if let content = post.content {
            cell.textLabel?.text = content
        }
        
        return cell
    }
 

}
