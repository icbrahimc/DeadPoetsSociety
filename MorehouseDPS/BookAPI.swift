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
    
    /** Return whether the user value exists in the database. */
    func newUser(uuid: String, completion: @escaping (Bool) -> ()) {
        rootDB.child("users").child(uuid).observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.exists() {
                completion(false)
            } else {
                completion(true)
            }
        })
    }
    
    /** Create user */
    func createUser(uuid: String, data: JSON) {
        let firstName: String = data["first_name"].stringValue
        let lastName: String = data["last_name"].stringValue
        let imageURL: String = data["picture"]["data"]["url"].stringValue
        let email: String = data["email"].stringValue
        
        let dataDictionary = [
            "first_name": firstName,
            "last_name": lastName,
            "imageURL": imageURL,
            "email": email,
        ]
        
        rootDB.child("users").child(uuid).setValue(dataDictionary, withCompletionBlock: { (err, ref) in
            if let error = err {
                print(error.localizedDescription)
            }
        })
    }
    
    /** Fetch all books from the database */
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
