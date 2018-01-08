//
//  ToastyView.swift
//  Toasty
//
//  Created by TRAING Serey on 08/01/2018.
//  Copyright © 2018 TRAING Serey. All rights reserved.
//

import UIKit

class ToastyView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    private static var sharedView: ToastyView!
    
    static func loadFromNib() -> ToastyView{
        return UINib(
            nibName: "ToastyView",
            bundle: nil
            ).instantiate(withOwner: nil, options: nil).first as! ToastyView
    }
    
    
    static func showIn(viewController: UIViewController, message: String) {
        var displayVC = viewController
        if let tabController = viewController as? UITabBarController {
            displayVC = tabController.selectedViewController ?? viewController
        }
        
        if sharedView == nil {
            sharedView = self.loadFromNib()
            sharedView.layer.masksToBounds = false
            sharedView.layer.shadowColor = UIColor.darkGray.cgColor
            sharedView.layer.shadowOpacity = 1
            sharedView.layer.shadowOffset = CGSize(width: 0, height: 3)
        }
        sharedView.messageLabel.text = message
        if sharedView?.superview == nil {
            let y = displayVC.view.frame.height - sharedView.frame.size.height - 12
            sharedView.frame = CGRect(x: 12, y: y, width: displayVC.view.frame.size.width - 24, height: sharedView.frame.size.height)
            sharedView.alpha = 0.0
            
            displayVC.view.addSubview(sharedView)
            sharedView.show()
            sharedView.perform(#selector(hide), with: nil, afterDelay: 3.0)
        }
    }
    
    // MARK: Animations
    func show() {
        UIView.animate(withDuration: 0.33, animations: {
            self.alpha = 1.0
        })
    }
    
    @objc func hide() {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        
        UIView.animate(withDuration: 0.33, animations: {
            self.alpha = 0.0
        }, completion: { _ in
            self.removeFromSuperview()
        })
    }
}

public struct ToastyStyle {
    public init() {}
    
    public var backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.8)
    public var messageColor: UIColor = .white
    public var messageAlignment: NSTextAlignment = .left
    public var messageNumberOfLines = 0
    public var fadeDuration: TimeInterval = 0.2
    public var cornerRadius: CGFloat = 10.0
}
