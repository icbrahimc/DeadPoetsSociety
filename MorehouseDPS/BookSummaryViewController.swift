//
//  BookSummaryViewController.swift
//  MorehouseDPS
//
//  Created by icbrahimc on 8/8/17.
//  Copyright © 2017 icbrahimc. All rights reserved.
//

import LBTAComponents
import UIKit

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
