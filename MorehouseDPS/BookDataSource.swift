//
//  BookDataSource.swift
//  MorehouseDPS
//
//  Created by icbrahimc on 8/18/17.
//  Copyright © 2017 icbrahimc. All rights reserved.
//

import Foundation
import LBTAComponents
import SwiftyJSON

class BookDataSource: Datasource {
    var books: [Books] = []
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [BookCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return books.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return books[indexPath.item]
    }
}

