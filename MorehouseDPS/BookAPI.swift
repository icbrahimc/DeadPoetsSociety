//
//  BookAPI.swift
//  MorehouseDPS
//
//  Created by icbrahimc on 7/31/17.
//  Copyright © 2017 icbrahimc. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import SwiftyJSON
import UIKit

class BookAPI: NSObject {
    static let sharedInstance = BookAPI()
    private let rootDB: DatabaseReference! = Database.database().reference()
    
    func fetchBooks(completion: @escaping (BookDataSource, [Books]) -> ()) {
        let bookDataSource = BookDataSource()
        var books: [Books] = []
        rootDB.child("books").observe(.value, with: { (snapshot) in
            for rest in snapshot.children.allObjects as! [DataSnapshot] {
                let snapJSON = JSON(rest.value)
                let title = snapJSON["title"].stringValue
                let author = snapJSON["author"].stringValue
                let imageURL = snapJSON["imageUrl"].stringValue
                let copies = snapJSON["copies"].intValue
                books.append(Books(author: author, title: title, copies: copies, imageURL: imageURL))
            }
            completion(bookDataSource, books)
        })
    }
}
