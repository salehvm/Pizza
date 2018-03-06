//
//  ViewController.swift
//  Pizza 2
//
//  Created by Saleh Majıdov on 3/1/18.
//  Copyright © 2018 Saleh Majıdov. All rights reserved.
//

import UIKit
import LocalAuthentication


class AuthViewController: UIViewController {

    
    var reverse: Bool = false
    
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailView: UIView!
    
    var popInteractive = KYPopInteractiveTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVars()
        initTexts()
        initViews()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func returnRegisterBtn(_ sender: Any) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController { 
            navigationController?.pushViewController(vc, animated: true)
            self.present(vc,animated: true)
         
        }
       
       
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.5
    }
    
   
   
    @IBAction func onLogin(_ sender: Any) {
    }
    
    
    func initVars(){
        
    }
    func initTexts(){
        
    }
    func initViews(){
        HelpFunctions.addShadowAndRoundedCornerToView(loginBtn, radius: 20)
        loginBtn.layer.shadowColor = UIColor.black.cgColor
        loginBtn.layer.shadowOffset = CGSize(width: 5, height: 5)
        loginBtn.layer.shadowRadius = 5
        loginBtn.layer.shadowOpacity = 0.2
    }
    
    @IBAction func btnTouch(_ sender: Any) {
        let authContext = LAContext()
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
            
            authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "we want to login", reply: { (wasCorrect, error) in
                
                if wasCorrect
                {
                 print("correct")
                    
                }
                else{
                    
                    print("incorrect")
                }
                
            })
            
        }
        else{
            
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .pop {
            let flip = KYPopTransition()
            return flip
        }
        else {
            return nil
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return popInteractive.interacting ? popInteractive : nil
    }

}

