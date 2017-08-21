//
//  UserDatasource.swift
//  MorehouseDPS
//
//  Created by icbrahimc on 8/20/17.
//  Copyright © 2017 icbrahimc. All rights reserved.
//

import Foundation
import LBTAComponents

class UserDatasource: Datasource {
    var userData: User?
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeaderCell.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserBookCell.self]
    }
    
    override func headerItem(_ section: Int) -> Any? {
        return userData
    }
}
