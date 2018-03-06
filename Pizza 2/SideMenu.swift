//
//  SideMenu.swift
//  Pizza 2
//
//  Created by Saleh Majıdov on 3/6/18.
//  Copyright © 2018 Saleh Majıdov. All rights reserved.
//

import UIKit
import RESideMenu

class SideMenu: RESideMenu {

    override func awakeFromNib() {
        self.menuPreferredStatusBarStyle = .lightContent
        self.contentViewController = storyboard?.instantiateViewController(withIdentifier: "tabbar")
        self.leftMenuViewController = storyboard?.instantiateViewController(withIdentifier: "LeftMenuViewController") as! LeftMenuViewController
          self.rightMenuViewController = storyboard?.instantiateViewController(withIdentifier: "RightMenuViewController") as! RightMenuViewController
        
        
        
//        self.parallaxEnabled = false
//        self.contentViewScaleValue = 1
//        self.contentViewInPortraitOffsetCenterX = 120
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
