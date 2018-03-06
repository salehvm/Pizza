//
//  HelpFunctions.swift
//  dream-card-app-ios
//
//  Created by Karim Karimov on 10/29/17.
//  Copyright © 2017 Karim Karimov. All rights reserved.
//

import Foundation
import UIKit
import SwiftMessages
import NVActivityIndicatorView
import Localize_Swift
import Reachability

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.withAlphaComponent(1).cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = HelpFunctions.hexStringToUIColor(hex: "e7e7e7").cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

extension UIImage{
    class func luminosity(image:UIImage) -> UIImage? {
        let rect = CGRect(origin: .zero, size: image.size)
        
        //image multiply
        UIGraphicsBeginImageContextWithOptions(image.size, true, 0)
        let context = UIGraphicsGetCurrentContext()
        
        // fill the background with white so that translucent colors get lighter
        context!.setFillColor(UIColor.white.cgColor)
        context!.fill(rect)
        
        image.draw(in: rect, blendMode: .luminosity, alpha: 1)
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return result
    }
}

class HelpFunctions {    
    //color
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    //UI
    static func makeRoundedCorner(view: UIView, radius: Int){
        view.layer.cornerRadius = CGFloat(radius);
        view.clipsToBounds = true;
    }
    
    static func makeRoundedColorfulBorder(view: UIView, radius: Int, width: Int, color: String){
        view.backgroundColor = .clear
        view.layer.cornerRadius = CGFloat(radius)
        view.layer.borderWidth = CGFloat(width)
        view.layer.borderColor = hexStringToUIColor(hex: color).cgColor
    }
    
    static func makeRoundedColorfulBorder(view: UIView, radius: Int, width: Int, color: UIColor){
        view.backgroundColor = .clear
        view.layer.cornerRadius = CGFloat(radius)
        view.layer.borderWidth = CGFloat(width)
        view.layer.borderColor = color.cgColor
        view.clipsToBounds = true
    }
    
    static func addShadowAndRoundedCornerToView(_ view: UIView, radius: Int){
        view.layer.cornerRadius = CGFloat(radius)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize.init(width: 0.5, height: 0.5)
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 1.0
    }
    
    static func addHigherShadowAndRoundedCornerToView(_ view: UIView, radius: Int){
        view.layer.cornerRadius = CGFloat(radius)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize.init(width: 1, height: 1)
        view.layer.shadowOpacity = 0.4
        view.layer.shadowRadius = 4.0
    }
    
    static func addShadowToView(_ view: UIView){
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize.init(width: 0.5, height: 0.5)
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 2.0
    }
    
    static func createGradientBg(_ view: UIView){
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.startPoint = CGPoint.init(x:0.5, y:1.0)
        gradient.endPoint = CGPoint.init(x:0.5, y:0.0)
        let color = hexStringToUIColor(hex: "202945")
        gradient.colors = [color.withAlphaComponent(1.0).cgColor,
                           color.withAlphaComponent(1.0).cgColor,
                           color.withAlphaComponent(0.0).cgColor]
        gradient.locations = [0.0,
                              0.1,
                              1.0]
        view.layer.mask = gradient
    }
    
    //progress
    static func createProgress(indicator: UIActivityIndicatorView, view: UIView){
        indicator.frame = CGRect.init(x: 0.0, y: 0.0, width: 60.0, height: 60.0);
        indicator.center = view.center
        indicator.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
        HelpFunctions.makeRoundedCorner(view: indicator, radius: 5);
        view.addSubview(indicator)
        indicator.bringSubview(toFront: view)
    }
    
    static func createIndicatorView(_ view: UIView) -> NVActivityIndicatorView {
        let frame = CGRect(x: view.frame.width / 2 - 15, y: view.frame.height / 2 - 15, width: 30, height: 30)
        return NVActivityIndicatorView(frame: frame, type: .ballPulseSync, color: hexStringToUIColor(hex: "E53935"), padding: CGFloat(0))
    }
    
    //progress pop-up
    static func showProgress(indicator: UIActivityIndicatorView, type: Bool){
        if(type){
            indicator.startAnimating()
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            UIApplication.shared.beginIgnoringInteractionEvents()
        }else{
            indicator.stopAnimating()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
    
    // MARK: - Alerts
    
    static func showLoginAlert(_ vc: UIViewController){
        let view: MessageView
        view = MessageView.viewFromNib(layout: .centeredView)
        
        view.configureContent(title: "promt_required_logged_user".localized(), body: "promt_login".localized(), iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "login".localized(), buttonTapHandler: { _ in
            SwiftMessages.hide()
//            AuthApi.toAuth(vc)
        })
        
        let iconStyle: IconStyle
        iconStyle = .light
        view.configureTheme(.warning, iconStyle: iconStyle)
        view.titleLabel?.isHidden = false
        view.button?.isHidden = false
        
        // Config setup
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .center
        config.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        config.shouldAutorotate = false
        config.interactiveHide = true
        
        // Show
        SwiftMessages.show(config: config, view: view)
    }
    
    static func showWarningCardAlert(_ text: String, showButton: Bool){
        let view: MessageView
        view = MessageView.viewFromNib(layout: .cardView)
        
        view.configureContent(title: "", body: text, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "okay".localized(), buttonTapHandler: { _ in SwiftMessages.hide() })
        
        let iconStyle: IconStyle
        iconStyle = .light
        view.configureTheme(.warning, iconStyle: iconStyle)
        view.titleLabel?.isHidden = true
        view.button?.isHidden = !showButton
        
        // Config setup
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .bottom
        config.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        config.shouldAutorotate = false
        config.interactiveHide = true
        
        // Show
        SwiftMessages.show(config: config, view: view)
    }
    
    static func showWarningCardAlertFromTop(_ text: String){
        let view: MessageView
        view = MessageView.viewFromNib(layout: .cardView)
        
        view.configureContent(title: "", body: text, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "okay".localized(), buttonTapHandler: { _ in SwiftMessages.hide() })
        
        let iconStyle: IconStyle
        iconStyle = .light
        view.configureTheme(.warning, iconStyle: iconStyle)
        view.titleLabel?.isHidden = true
        view.button?.isHidden = true
        
        // Config setup
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .top
        config.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        config.shouldAutorotate = false
        config.interactiveHide = true
        
        // Show
        SwiftMessages.show(config: config, view: view)
    }
    
    static func showSuccessCardAlert(_ text: String, showButton: Bool){
        let view: MessageView
        view = MessageView.viewFromNib(layout: .cardView)
        
        view.configureContent(title: "", body: text, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "okay".localized(), buttonTapHandler: { _ in SwiftMessages.hide() })
        
        let iconStyle: IconStyle
        iconStyle = .light
        view.configureTheme(.success, iconStyle: iconStyle)
        view.titleLabel?.isHidden = true
        view.button?.isHidden = !showButton
        
        // Config setup
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .bottom
        config.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        config.shouldAutorotate = false
        config.interactiveHide = true
        
        // Show
        SwiftMessages.show(config: config, view: view)
    }
    
    static func showErrorCardAlert(_ text: String, showButton: Bool){
        let view: MessageView
        view = MessageView.viewFromNib(layout: .cardView)
        
        view.configureContent(title: "", body: text, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "okay".localized(), buttonTapHandler: { _ in SwiftMessages.hide() })
        
        let iconStyle: IconStyle
        iconStyle = .light
        view.configureTheme(.error, iconStyle: iconStyle)
        view.titleLabel?.isHidden = true
        view.button?.isHidden = !showButton
        
        // Config setup
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .bottom
        config.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        config.shouldAutorotate = false
        config.interactiveHide = true
        
        // Show
        SwiftMessages.show(config: config, view: view)
    }
    
    //Language
    static func getLanguage() -> String {
        return Localize.currentLanguage();
    }
    
    static func isValidEmail(_ str:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: str)
    }
    
    static func getVersion() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        return "\(version)"
    }
}

