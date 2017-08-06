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
    static let rootDB: DatabaseReference! = Database.database().reference()
    
    /**
      Fetch book information.
    */
    func fetchBooks() -> [JSON] {
        var returnDic: [JSON] = []
        rootDB.child("Books").observe(.value, with: { (snapshot) in
            print(snapshot)
        })
        print(returnDic)
        return returnDic
    }
    
}
