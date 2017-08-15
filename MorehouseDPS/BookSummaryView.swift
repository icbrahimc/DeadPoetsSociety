//
//  BookSummaryView.swift
//  MorehouseDPS
//
//  Created by icbrahimc on 8/15/17.
//  Copyright © 2017 icbrahimc. All rights reserved.
//

import UIKit

class BookSummaryView: UIScrollView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupHeaderView()
    }
    
    let headerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: (UIApplication.shared.keyWindow?.bounds.size.width)!, height: (UIApplication.shared.keyWindow?.bounds.size.height)! / 3))
        view.backgroundColor = .red
        return view
    }()
    
    func setupHeaderView() {
        self.addSubview(headerView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
