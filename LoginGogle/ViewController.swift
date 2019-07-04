//
//  ViewController.swift
//  LoginGogle
//
//  Created by Bui Van Tuan on 7/4/19.
//  Copyright © 2019 Nguyen khac vu. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate{

    @IBOutlet weak var showSignIn: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARk: buttonGoogle
        let googleSignInbutton = GIDSignInButton()
        googleSignInbutton.center = view.center
        view.addSubview(googleSignInbutton)
        
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance()?.delegate = self
    }
    @IBAction func SignInWithGoogle(_ sender: Any) {
    GIDSignIn.sharedInstance()?.signIn()
    }
    @IBAction func signOuttWithGoogle(_ sender: Any) {
       GIDSignIn.sharedInstance()?.signOut()
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
            let userId = user.userID
            print(userId)
            
            let idToken = user.authentication.idToken
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            // ...
        }
    }
}

