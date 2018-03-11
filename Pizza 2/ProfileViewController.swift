//
//  ProfileViewController.swift
//  Pizza 2
//
//  Created by Saleh Majıdov on 3/11/18.
//  Copyright © 2018 Saleh Majıdov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    //MARK: - IBOutlets
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var phoneView: UIView!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var changeBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSave(_ sender: Any) {
    }
    
    
    @IBAction func changePass(_ sender: Any) {
    }
    
   

}
