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
        backgroundColor = .green
    }
    
    let thumbNail: CustomImageView = {
        let imageView = CustomImageView()
        imageView.image = #imageLiteral(resourceName: "LaunchScreen")
        return imageView
    }()
}

class BookSummaryDataSource: Datasource {
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [BookSummaryHeaderCell.self]
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
        return CGSize(width: view.frame.width, height: 100)
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
