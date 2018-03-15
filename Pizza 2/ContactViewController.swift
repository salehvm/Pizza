//
//  ContactViewController.swift
//  Pizza 2
//
//  Created by Saleh Majıdov on 3/15/18.
//  Copyright © 2018 Saleh Majıdov. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    
    
    var items = [Message]()
    var meterTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        initVars()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func initVars(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)
        
        messageField.delegate = self
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        
       
    }
    
    @objc func tableViewTapped(){
        messageField.endEditing(true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = messageTableView.dequeueReusableCell(withIdentifier: "RightCell", for: indexPath) as! RightTableViewCell
        
       
        
   
        
        return cell
        
        
    }
    
    
    
    func configureTableView(){
        
        messageTableView.rowHeight = UITableViewAutomaticDimension
        messageTableView.estimatedRowHeight = 130.0
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 318
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 50
            self.view.layoutIfNeeded()
        }
    }
    

}


