//
//  PizzaListViewController.swift
//  Pizza 2
//
//  Created by Saleh Majıdov on 3/7/18.
//  Copyright © 2018 Saleh Majıdov. All rights reserved.
//

import UIKit
import PullToMakeSoup

class PizzaListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var addMenu: UIView!
    @IBOutlet weak var normalMenu: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var tapGestureRecognizer = UITapGestureRecognizer()
    let refresher:PullToMakeSoup = PullToMakeSoup(at: .top)
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        self.tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = 5.0;

        initVars()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //        tableView.addPullToRefresh(refresher) {
        //
        //            self.tableView.startRefreshing(at: .top)
        //            print("pulling now")
        //        }
        tableView.addPullToRefresh(PullToMakeSoup(at: .top))  {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.tableView.endRefreshing(at: .top)
            }
        }
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.contentView.layoutMargins.bottom = 20
        
        cell.textLabel?.text = "\(indexPath.row)"
  
        return cell
        
    }

    
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        if indexPath.row == 0{
    //            self.tableView.endRefreshing(at: .top)
    //        }
    //
    //    }
}
