//
//  LoginViewController.swift
//  DailyNewsIOS
//
//  Created by user on 2018-08-11.
//  Copyright © 2018 RavSingh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var switchRememberMe: UISwitch!
    
    var userDefault: UserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.userDefault = UserDefaults.standard
        if let userEmail = userDefault?.value(forKey: "UserName")
        {
            txtEmail.text = userEmail as? String
        }
        if let userPassword = userDefault?.value(forKey: "Password")
        {
            txtPassword.text = userPassword as? String
            //self.switchRemberMe.setOn(true, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        if txtEmail.text == "admin" && txtPassword.text == "admin123"
        {
            if self.switchRememberMe.isOn
            {
                self.userDefault?.set(txtEmail.text, forKey: "UserName")
                self.userDefault?.set(txtPassword.text, forKey: "Password")
            }
            else{
                self.userDefault?.removeObject(forKey: "UserName")
                self.userDefault?.removeObject(forKey: "Password")
            }
            
            performSegue(withIdentifier: "LoginVc", sender: self)
        }
        else{
        }
    }
    
    

}
