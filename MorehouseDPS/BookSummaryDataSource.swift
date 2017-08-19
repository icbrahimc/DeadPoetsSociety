//
//  BookSummaryDatasource.swift
//  MorehouseDPS
//
//  Created by icbrahimc on 8/19/17.
//  Copyright © 2017 icbrahimc. All rights reserved.
//

import Foundation
import LBTAComponents
import SwiftyJSON

class BookSummaryDataSource: Datasource {
    var book: Books?
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [BookSummaryHeaderCell.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [BookSummaryCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return 1
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return book
    }
    
    override func headerItem(_ section: Int) -> Any? {
        return book
    }
}
