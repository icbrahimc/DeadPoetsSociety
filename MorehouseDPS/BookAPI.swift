//
//  BookAPI.swift
//  MorehouseDPS
//
//  Created by icbrahimc on 7/31/17.
//  Copyright © 2017 icbrahimc. All rights reserved.
//

import FirebaseAuth
import FirebaseDatabase
import UIKit

class BookAPI: NSObject {
    static let sharedInstance = BookAPI()
    private let rootDB: DatabaseReference! = Database.database().reference()
}
