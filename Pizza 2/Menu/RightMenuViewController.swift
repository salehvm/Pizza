//
//  RightMenuViewController.swift
//  Pizza 2
//
//  Created by Saleh Majıdov on 3/6/18.
//  Copyright © 2018 Saleh Majıdov. All rights reserved.
//

import UIKit

class RightMenuViewController: UIViewController {
    
    //MARK: - IBOutles
    
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var deliveryView: UIView!
    @IBOutlet weak var pizzalistView: UIView!
    @IBOutlet weak var historyView: UIView!
    @IBOutlet weak var contactView: UIView!
    @IBOutlet weak var logoutView: UIView!
    
 
    
    //MARK: - Variables
    
    var tapGestureRecognizer = UITapGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initVars()
        initViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    

    //MARK: - Click Handles
    
    func initVars(){
        self.tapGestureRecognizer.numberOfTapsRequired = 1
        
        
        self.tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(homeRoute))
        self.homeView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
   @objc func homeRoute(){
    
    if let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {

        self.navigationController?.pushViewController(vc, animated: true)
        print(vc)
    }
    
    

    }
    
    func initViews(){}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
