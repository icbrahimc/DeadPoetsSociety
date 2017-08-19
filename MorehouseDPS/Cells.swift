//
//  Cells.swift
//  MorehouseDPS
//
//  Created by icbrahimc on 8/19/17.
//  Copyright © 2017 icbrahimc. All rights reserved.
//

import Foundation
import LBTAComponents

class BookCell: DatasourceCell {
    var book: Books? {
        didSet {
            bookImage.loadImageUsingUrlString((book?.imageURL)!)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        addSubview(bookImage)
        bookImage.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
    }
    
    let bookImage: CustomImageView = {
        let imageView = CustomImageView()
        imageView.backgroundColor = UIColor.white
        return imageView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
