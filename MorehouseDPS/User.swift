//
//  User.swift
//  MorehouseDPS
//
//  Created by icbrahimc on 8/19/17.
//  Copyright © 2017 icbrahimc. All rights reserved.
//

import Foundation

class User: NSObject {
    let firstName: String?
    let lastName: String?
    let email: String?
    let imageURL: String?
    let mID: String?
    
    override init() {
        self.firstName = nil
        self.lastName = nil
        self.email = nil
        self.imageURL = nil
        self.mID = nil
    }
    
    init(firstName: String, lastName: String, email: String, imageURL: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.imageURL = imageURL
        self.mID = nil
    }
}
