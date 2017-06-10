//
//  Books.swift
//  MorehouseDPS
//
//  Created by icbrahimc on 6/8/17.
//  Copyright © 2017 icbrahimc. All rights reserved.
//

import FirebaseDatabase
import UIKit

/*
 This is the book class. This is where the data for books is populated and sent
 to the database.
*/

let dataBaseRef = AppDelegate()

class Books: NSObject {
    var title: NSString?
    var author: NSString?
    var numberOfCopies: NSNumber?
    var imageUrl: NSString?
    
    init(newTitle: NSString, newAuthor: NSString, newNumber: NSNumber) {
        title = newTitle
        author = newAuthor
        numberOfCopies = newNumber
    }
    
    // Set the image url for the book.
    func setImageUrl(url: NSString) -> Void {
        imageUrl = url
    }
    
    // Submit the book to the database.
    func submitBook() -> Void {
        var ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference()

        // Set up the NSDictionary.
        var dataDic: NSDictionary!
        dataDic = NSDictionary(dictionary: ["author": author ?? NSString(string: "Ibrahim")])
        
        
//        dataDic.setValuesForKeys(["author": author ?? NSString(string: "Ibrahim")])
        ref.child("Books").child(title! as String).setValue(dataDic)
    }
}
