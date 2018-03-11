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
    

    //MARK: - Click Handles
    
    func initVars(){
        self.tapGestureRecognizer.numberOfTapsRequired = 1
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
