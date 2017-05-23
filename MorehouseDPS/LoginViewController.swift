//
//  LoginViewController.swift
//  MorehouseDPS
//
//  Created by icbrahimc on 5/20/17.
//  Copyright © 2017 icbrahimc. All rights reserved.
//

/*
 
 // Add this to the header of your file, e.g. in ViewController.m
 // after #import "ViewController.h"
 #import <FBSDKCoreKit/FBSDKCoreKit.h>
 #import <FBSDKLoginKit/FBSDKLoginKit.h>
 
 // Add this to the body
 @implementation ViewController
 
 - (void)viewDidLoad {
 [super viewDidLoad];
 FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
 // Optional: Place the button in the center of your view.
 loginButton.center = self.view.center;
 [self.view addSubview:loginButton];
 }
 
 @end
 */

import UIKit
import FirebaseAuth
import FBSDKCoreKit
import FBSDKLoginKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fbLoginBtn: FBSDKLoginButton = FBSDKLoginButton()
        fbLoginBtn.center = self.view.center
        self.view.addSubview(fbLoginBtn)
        
        fbLoginBtn.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Check if the user has signed.
        let handle = FIRAuth.auth()?.addStateDidChangeListener { (auth, user) in
            // ...
        }
    }
    
    // Facebook login button delegates.
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        // Get the access token and authenticate.
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else {
            return
        }
        
        let credential = FIRFacebookAuthProvider.credential(withAccessToken: accessTokenString)
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            // ...
            if let error = error {
                print(error.localizedDescription)
                return
            }
        }
        
        
        
        
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
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
