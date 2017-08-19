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
            bookImage.loadImageUsingUrlString(book.imageURL!)
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
}

class BookSummaryCell: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        
        addSubview(summaryLabel)
        addSubview(summaryText)
        
        // Anchors
        summaryLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 6, leftConstant: 6, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        summaryText.anchor(summaryLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 6, leftConstant: 3, bottomConstant: 0, rightConstant: 6, widthConstant: frame.width, heightConstant: frame.height)
    }
    
    let summaryLabel: UILabel = {
        let summary = UILabel()
        summary.text = "Summary"
        summary.font = UIFont.boldSystemFont(ofSize: 14)
        return summary
    }()
    
    let summaryText: UITextView = {
        let summary = UITextView()
        summary.text = "hgghghhgsnklnldndnlkgsnkngfljngfjknjdfsnzgjknvkljsnkgdnbjlhbnzjhlfbsnfljhabnhdbhksbnavkjnfkjvnajkndjkabsfkjbkhbfhjvbsafjha dnsacn kfnkjvndsfkjndkjafsNsakjdbncakbklshdfbnjlhdbnjlhsbfklhjdbnjlasnbfsjvandsfdbfabusdbjhsdbjbsdgsdBfdhsbfjafunauncunueufebyfebfebjhkvajdsbdfsabfsufrbguklfidgfhiuguareghuagerhgyrebbaekrjasbubfeayiarbkilsgciyteailafebukaeioheywyuiufewkagbhiewlukjfhuiekjhbejLAKDbfafiljknwehfuikbejwdvdlbhkgdsvlhbkfehjsnjdvsbuhfkjndvizohuzbkhvdjnzoivjhbkdjfesdiohubhzdjfksndiovhiudfbhejknsdzivjizdjbhfskdvhdfjhsbeknvxhdjbfsheknvxhidfsjbzkdvxchdfjbhsknvxchjbdfsdkvxciuhuhjbdfsznkvchiujhbdfsnjkvcvhjbdfsnkdvcihjdsnsjkijchjdsjdiuzhkjsamdjkikdnfsmeafdkkjdfmsnahujdbfnsmhuvdjkfsnmhvdjfsbnmhcvjdfsmnmvchjjdfns nvcjdnf ncjndfs ncjndfs ncbdfs nhjcdfnshjvcxdfnsvcbdfshxbzdfnsxhbvdnzvxcjnmfsdjxn sfdjhbndsfnxnxcbn bcxncbnvbjn cvjbxncsjbdfhznhzjbzjbhvnvjhbndbjhdndhbjdzshbjzdhdhzbjzdhbhdzjjkdzgdnvzkuhbdhvdsncihkssuilvzbndozbsvbui;ldhviosghionusozihuncoudsihsfbuigcshdzoifuvchsiuduibhdofuisvbfvztsufbunzui7sozi6hfsnzsoipfeohofunyeiuHnuGUCVYbunefysgzj fbknfebzeusbusfijonkfiulnszfohuzsdoifgo"
        return summary
    }()
}

class BookSummaryHeaderCell: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor.black
        
        addSubview(thumbNail)
        addSubview(titleLabel)
        addSubview(authorLabel)
        
        // Anchors
        thumbNail.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 90, heightConstant: 150)
        titleLabel.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 6, widthConstant: 0, heightConstant: 20)
        authorLabel.anchor(titleLabel.bottomAnchor, left: nil, bottom: nil, right: titleLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
    }
    
    let thumbNail: CustomImageView = {
        let imageView = CustomImageView()
        let profileImage: UIImage = #imageLiteral(resourceName: "LaunchScreen")
        imageView.image = profileImage
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Morehouse Dead Poets Society"
        title.font = UIFont.boldSystemFont(ofSize: 14)
        return title
    }()
    
    let authorLabel: UILabel = {
        let author = UILabel()
        author.text = "By: Ibrahim Conteh"
        author.font = UIFont.systemFont(ofSize: 10)
        return author
    }()
}
