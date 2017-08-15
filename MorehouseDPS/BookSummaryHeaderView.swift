//
//  BookSummaryHeaderView.swift
//  MorehouseDPS
//
//  Created by icbrahimc on 8/15/17.
//  Copyright © 2017 icbrahimc. All rights reserved.
//

import UIKit

class BookSummaryHeaderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    let thumbnailView: CustomImageView = {
        let imageView = CustomImageView()
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "The Autobiography of Malcolm X"
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "Alex Haley"
        return label
    }()
    
    func setupView() {
        addSubview(thumbnailView)
        addSubview(titleLabel)
        addSubview(authorLabel)
        
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
