//
//  LoginViewController.swift
//  MorehouseDPS
//
//  Created by icbrahimc on 5/20/17.
//  Copyright © 2017 icbrahimc. All rights reserved.
//

import UIKit
import FirebaseAuth
import FBSDKCoreKit
import FBSDKLoginKit

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the view controller.
        self.navigationController?.isNavigationBarHidden = true
        
        // Offsets for the screen.
        let offsetY: CGFloat = UIScreen.main.bounds.maxY
        
        // Setup the login button.
        let loginButtonFrame = CGRect(x: 0, y: offsetY * 0.5
            , width: view.frame.width - 32, height: 50)
        
        // Custom Facebook login.
        let fbLogin = UIButton(type: .system)
        fbLogin.frame = loginButtonFrame
        fbLogin.setTitle("Log In With Facebook", for: .normal)
        fbLogin.setTitleColor(.white, for: .normal)
        fbLogin.backgroundColor = .blue
        fbLogin.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        fbLogin.layer.cornerRadius = 25.0
        fbLogin.layer.masksToBounds = true
        fbLogin.center.x = self.view.center.x
        
        fbLogin.addTarget(self, action: #selector(handleFaceBookLogin), for: .touchUpInside)
        view.addSubview(fbLogin)
        // Do any additional setup after loading the view.
    }
    
    /** Facebook Auth */
    func handleFaceBookLogin() {
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile"], from: self, handler: {
            (result, err) in
            if let error = err {
                print(error.localizedDescription)
                return
            }
            
            // Get the access token and authenticate.
            let accessToken = FBSDKAccessToken.current()
            guard let accessTokenString = accessToken?.tokenString else {
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
            Auth.auth().signIn(with: credential) { (user, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                // If the user is signed in and authenticated, segue to a new view controller.
                if let newUser = user {
                    
                    let graphPath = "me"
                    let parameters = ["fields": "id, email, name, first_name, last_name, picture"]
                    let graphRequest = FBSDKGraphRequest(graphPath: graphPath, parameters: parameters)
                    let connection = FBSDKGraphRequestConnection()
                    
                    connection.add(graphRequest, completionHandler: { (connection, result, error) in
                        if let error = error {
                            print(error.localizedDescription)
                        }
                        
                        BookAPI.sharedInstance.newUser(uuid: newUser.uid, completion: { (newUserFlag) in
                            if newUserFlag {
                                
                            } else {
                                
                            }
                        })
                    })
                    connection.start()
                }
            }
        })
    }
}
