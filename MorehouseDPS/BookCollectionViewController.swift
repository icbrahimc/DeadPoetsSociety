//
//  BookCollectionViewController.swift
//  MorehouseDPS
//
//  Created by icbrahimc on 6/6/17.
//  Copyright © 2017 icbrahimc. All rights reserved.
//

import FirebaseDatabase
import LBTAComponents
import SwiftyJSON
import UIKit

private let reuseIdentifier = "bookCollectionViewCell"
fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
fileprivate let itemsPerRow: CGFloat = 3

class BookCollectionViewController: DatasourceController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        BookAPI.sharedInstance.fetchBooks(completion: { (bookDataSource, books) in
            bookDataSource.books = books
            self.datasource = bookDataSource
            self.collectionView?.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let bookData = self.datasource?.item(indexPath) as? Books {
            // Instantiate the BookSummaryVC and assign the book data to the VC.
            let BookVC = BookSummaryViewController()
            BookVC.bookData = bookData
            navigationController?.pushViewController(BookVC, animated: false)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 2.0
        cell?.layer.borderColor = UIColor.clear.cgColor
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: self.view.frame.height / 4)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
