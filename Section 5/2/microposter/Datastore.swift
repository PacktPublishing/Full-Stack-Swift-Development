//
//  Datastore.swift
//  microposter
//
//  Created by Johann Kerr on 8/23/18.
//  Copyright © 2018 Johann Kerr. All rights reserved.
//

import Foundation
import CoreData
import UIKit

final class Datastore {
    
    static let shared = Datastore()
    
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    var posts = [SavedPost]()
    fileprivate init() {}
    
    func fetchPosts(handler: ([SavedPost]) -> ()) {
        
        do {
            self.posts = try context.fetch(SavedPost.fetchRequest())
            handler(self.posts)
        } catch {
            
        }
    }
    
    func fetchPostsForUserAtId(id: Int, handler: ([Post]) -> ()) {
        var fetchRequest: NSFetchRequest<Author> = Author.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        do {
            let authors = try context.fetch(fetchRequest)
            if let author = authors.first {
                let posts = author.posts?.allObjects as! [Post]
                handler(posts)
            }
        } catch {
            
        }
    }
    
}


