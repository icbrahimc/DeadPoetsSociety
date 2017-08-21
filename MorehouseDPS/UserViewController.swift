//
//  UserViewController.swift
//  MorehouseDPS
//
//  Created by icbrahimc on 8/19/17.
//  Copyright © 2017 icbrahimc. All rights reserved.
//

import FirebaseAuth
import LBTAComponents
import UIKit

class UserViewController: DatasourceController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let userID = Auth.auth().currentUser?.uid
        BookAPI.sharedInstance.fetchUserData(uuid: userID!, completion: { (datasource) in
            self.datasource = datasource
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
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
