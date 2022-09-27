//
//  LoginViewController.swift
//  Twitter
//
//  Created by Paulina DeVito on 9/18/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    
    
    // MARK: - Logout Action
    // "Action" means that anything you put into an action function will be executed when the code runs.
    
    @IBAction func onLoginButton(_ sender: Any) {
        
        let myUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            
            // identifier is the segue that we named loginToHome
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
        }, failure: { Error in
            print("Could not login!")
        })
    }
    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    //}

}
