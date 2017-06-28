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
let defaultURl = "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwi5r62cirLUAhVLoJQKHf7cAX8QjRwIBw&url=https%3A%2F%2Fwww.amazon.com%2F1984-Signet-Classics-George-Orwell%2Fdp%2F0451524934&psig=AFQjCNEHhSAkcy_Rpojr_16xaKCJmsaaQQ&ust=1497141957568448"

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
    func submitBook(count: String) -> Void {
        var ref: DatabaseReference!
        ref = Database.database().reference()

        // Set up the NSDictionary.
        let dataDic: NSDictionary = [
            "title": title ?? NSString(string: "Ibrahim"),
            "author": author ?? NSString(string: "Ibrahim"),
            "copies": numberOfCopies ?? NSNumber(integerLiteral: 0),
            "imageUrl": imageUrl ?? NSString(string: defaultURl)
        ]
        
//        dataDic.setValuesForKeys(["author": author ?? NSString(string: "Ibrahim")])
        ref.child("Books").child(count).setValue(dataDic)
    }
}
