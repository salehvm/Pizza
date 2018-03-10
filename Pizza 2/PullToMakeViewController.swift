//
//  PullToMakeViewController.swift
//  Pizza 2
//
//  Created by Saleh Majıdov on 3/11/18.
//  Copyright © 2018 Saleh Majıdov. All rights reserved.
//

import UIKit
import PullToMakeSoup

class PullToMakeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let refresher:PullToMakeSoup = PullToMakeSoup(at: .top)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       tableView.delegate = self
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
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
