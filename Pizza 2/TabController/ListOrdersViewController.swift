//
//  ListOrdersViewController.swift
//  Pizza 2
//
//  Created by Saleh Majıdov on 3/6/18.
//  Copyright © 2018 Saleh Majıdov. All rights reserved.
//

import UIKit

class ListOrdersViewController: UIViewController {


    @IBOutlet weak var normalMenu: UIView!
    
    
    @IBOutlet weak var addMenu: UIView!
    
    var tapGestureRecognizer = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVars()
        
    }

    func initVars(){
        self.tapGestureRecognizer.numberOfTapsRequired = 1
        self.tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(SideMenu.presentLeftMenuViewController(_:)))
        self.addMenu.addGestureRecognizer(tapGestureRecognizer)
        self.tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(SideMenu.presentRightMenuViewController(_:)))
        self.normalMenu.addGestureRecognizer(tapGestureRecognizer)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
