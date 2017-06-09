//
//  Books.swift
//  MorehouseDPS
//
//  Created by icbrahimc on 6/8/17.
//  Copyright © 2017 icbrahimc. All rights reserved.
//

import UIKit

/*
 This is the book class. This is where the data for books is populated and sent
 to the database.
*/
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
}
