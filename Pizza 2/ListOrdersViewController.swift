//
//  ListOrdersViewController.swift
//  Pizza 2
//
//  Created by Saleh Majıdov on 3/6/18.
//  Copyright © 2018 Saleh Majıdov. All rights reserved.
//

import UIKit

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var buttonLeftMenu: UIButton!
    
    @IBOutlet weak var buttonRightMenu: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        buttonLeftMenu.addTarget(self, action: #selector(SideMenu.presentLeftMenuViewController(_:)), for: .touchUpInside)
        
        
         buttonRightMenu.addTarget(self, action: #selector(SideMenu.presentRightMenuViewController(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
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
