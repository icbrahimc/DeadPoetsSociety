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
    override var datasourceItem: Any? {
        didSet {
            guard let book = datasourceItem as? Books else { return }
            if let url = book.imageURL {
                bookImage.loadImageUsingUrlString(url)
            }
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
        imageView.layer.shadowColor = UIColor.black.cgColor;
        imageView.layer.shadowOffset = CGSize(width: 1, height: 1);
        imageView.layer.shadowOpacity = 0.5;
        imageView.layer.shadowRadius = 3.0;
        imageView.clipsToBounds = false;
        return imageView
    }()
}

class BookSummaryCell: DatasourceCell {
    override var datasourceItem: Any? {
        didSet {
            guard let book = datasourceItem as? Books else { return }
            let summary = book.summary
            summaryText.text = summary
        }
    }
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .black
        
        addSubview(summaryLabel)
        addSubview(summaryText)
        
        // Anchors
        summaryLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 6, leftConstant: 6, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        summaryText.anchor(summaryLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 6, leftConstant: 6, bottomConstant: 0, rightConstant: 6, widthConstant: 0, heightConstant: 0)
    }
    
    let summaryLabel: UILabel = {
        let summary = UILabel()
        summary.text = "Summary"
        summary.font = UIFont.boldSystemFont(ofSize: 14)
        summary.textColor = UIColor.dpsGreen
        return summary
    }()
    
    let summaryText: UILabel = {
        let summary = UILabel()
        summary.textColor = UIColor.dpsGreen
        summary.font = UIFont.systemFont(ofSize: 12)
        summary.numberOfLines = 0
        summary.lineBreakMode = NSLineBreakMode.byWordWrapping
        return summary
    }()
}

class BookSummaryHeaderCell: DatasourceCell {
    override var datasourceItem: Any? {
        didSet {
            guard let book = datasourceItem as? Books else { return }
            let title: String = book.title!
            let author: String = book.author!
            // Set the cell data.
            authorLabel.text = author
            titleLabel.text = title
            thumbNail.loadImageUsingUrlString(book.imageURL!)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .black
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor.dpsGreen
        
        addSubview(thumbNail)
        addSubview(titleLabel)
        addSubview(authorLabel)
        
        // Anchors
        thumbNail.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 90, heightConstant: 150)
        titleLabel.anchor(self.topAnchor, left: thumbNail.rightAnchor, bottom: nil, right: self.rightAnchor, topConstant: 20, leftConstant: 20, bottomConstant: 0, rightConstant: 6, widthConstant: 0, heightConstant: 0)
        authorLabel.anchor(titleLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
    }
    
    let thumbNail: CustomImageView = {
        let imageView = CustomImageView()
        imageView.layer.shadowColor = UIColor.black.cgColor;
        imageView.layer.shadowOffset = CGSize(width: 1, height: 1);
        imageView.layer.shadowOpacity = 0.5;
        imageView.layer.shadowRadius = 3.0;
        imageView.clipsToBounds = false;
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Morehouse Dead Poets Society"
        title.font = UIFont.boldSystemFont(ofSize: 14)
        title.numberOfLines = 0
        title.lineBreakMode = NSLineBreakMode.byWordWrapping
        title.textColor = UIColor.dpsGreen
        return title
    }()
    
    let authorLabel: UILabel = {
        let author = UILabel()
        author.text = "By: Ibrahim Conteh"
        author.font = UIFont.systemFont(ofSize: 10)
        author.textColor = UIColor.dpsGreen
        return author
    }()
}

class UserHeaderCell: DatasourceCell {
    override var datasourceItem: Any? {
        didSet {
            guard let user = datasourceItem as? User else { return }
            let fName = user.firstName
            let imageURL = user.imageURL
            
            profilePhoto.loadImageUsingUrlString(imageURL!)
            fNameLabel.text = fName
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor.black
        
        addSubview(profilePhoto)
        addSubview(fNameLabel)
        addSubview(lNameLabel)
        
        // Anchors
        profilePhoto.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 6, leftConstant: 6, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        fNameLabel.anchor(profilePhoto.topAnchor, left: profilePhoto.rightAnchor, bottom: nil, right: nil, topConstant: 2, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
    }
    
    let profilePhoto: CustomImageView = {
        let imageView = CustomImageView()
        imageView.layer.cornerRadius = 25
        imageView.layer.borderWidth = 3.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let fNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let lNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
}

class UserBookCell: DatasourceCell {
    override func setupViews() {
        super.setupViews()
    }
}
