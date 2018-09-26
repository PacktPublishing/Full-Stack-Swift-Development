//
//  Post.swift
//  microposter
//
//  Created by Johann Kerr on 7/9/18.
//  Copyright © 2018 Johann Kerr. All rights reserved.
//

import Foundation

struct Post: Codable {
    var content: String
    var id: Int
    var authorID: Int
}
