//
//  BookSummaryViewController.swift
//  MorehouseDPS
//
//  Created by icbrahimc on 8/8/17.
//  Copyright © 2017 icbrahimc. All rights reserved.
//

import LBTAComponents
import UIKit

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

class BookSummaryDataSource: Datasource {
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [BookSummaryHeaderCell.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [BookSummaryCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return 1
    }
}

class BookSummaryViewController: DatasourceController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let dataSource = BookSummaryDataSource()
        self.datasource = dataSource
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 200)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
