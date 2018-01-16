//
//  ToastyView.swift
//  Toasty
//
//  Created by TRAING Serey on 08/01/2018.
//  Copyright © 2018 TRAING Serey. All rights reserved.
//

import UIKit

public class ToastyView: UIView {

    //TACHE
    //Faire une structure ToastyStyle avec plusieurs attributs de perso
    //Dans la structure, ne pas oublier les tailles des vues et changer avec les valeurs en durs
    
    //Pour tester
    //Créer un projet
    //Faite un glisser deposer du framework (qui se trouve dans le dossier products que tu vois a gauche dans le projet sur xcode)
    //Ajouter 3 boutons et mettre les ibactions
    //Appeler la fonction ToastyView.showToast(.....)
    //Ne pas oublier de mettre dans le projet dans le Embeded Binaries le framework
    
    public static func showToast(viewController: UIViewController, withSimpleMessage message: String?) {
        let screenSize: CGRect = UIScreen.main.bounds
        var messageLabel: UILabel?
        let toastyView = ToastyView()
        
        //Position de la view ici
        toastyView.frame = CGRect(x: 10, y: screenSize.height-60 , width: viewController.view.frame.size.width - 20, height: 50)
        toastyView.alpha = 0.0
        toastyView.layer.cornerRadius = 10.0
        toastyView.backgroundColor = UIColor.red.withAlphaComponent(0.6)
        toastyView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        
        if let message = message {
            messageLabel = UILabel()
            messageLabel?.text = message
            messageLabel?.numberOfLines = 0
            messageLabel?.textAlignment = .center
            messageLabel?.lineBreakMode = .byTruncatingTail;
            messageLabel?.backgroundColor = UIColor.clear
        
        }
        
        if let messageLabel = messageLabel {
            toastyView.addSubview(messageLabel)
            messageLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: toastyView, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: toastyView, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: toastyView.frame.width - 40).isActive = true
            NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 30).isActive = true
        }
        
        viewController.view.addSubview(toastyView)
        toastyView.show()
        toastyView.perform(#selector(hide), with: nil, afterDelay: 3.0)
    }
    
    
    public static func showToast(viewController: UIViewController, withMessage message: String?, andImage image: UIImage?) {
        let screenSize: CGRect = UIScreen.main.bounds
        var messageLabel: UILabel?
        var imageView: UIImageView?
        let toastyView = ToastyView()
        
        //Position de la view ici
        toastyView.frame = CGRect(x: 10, y: screenSize.height-110 , width: viewController.view.frame.size.width - 20, height: 100)
        toastyView.alpha = 0.0
        toastyView.layer.cornerRadius = 10.0
        toastyView.backgroundColor = UIColor.red.withAlphaComponent(0.6) //pour la transparence
        toastyView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        
        if let image = image {
            imageView = UIImageView(image: image)
            imageView?.contentMode = .scaleAspectFit
            imageView?.frame = CGRect(x: 10.0, y: 10.0, width: 80.0, height: 80.0)
            toastyView.addSubview(imageView!)
            imageView?.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint(item: imageView, attribute: .leftMargin, relatedBy: .equal, toItem: toastyView, attribute: .leftMargin, multiplier: 1, constant: 10).isActive = true
            NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: toastyView, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 80).isActive = true
            NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 80).isActive = true
        }
        
        
        if let message = message {
            messageLabel = UILabel()
            messageLabel?.text = message
            messageLabel?.numberOfLines = 0
            messageLabel?.textAlignment = .center
            messageLabel?.lineBreakMode = .byTruncatingTail;
            messageLabel?.backgroundColor = UIColor.clear
        }
        
        if let messageLabel = messageLabel {
            toastyView.addSubview(messageLabel)
            messageLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: toastyView.frame.width - 90).isActive = true //90 parce que 80 taille image et 10 en plus comme ça pour pas coller
            NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 80).isActive = true
            NSLayoutConstraint(item: messageLabel, attribute: .leftMargin, relatedBy: .equal, toItem: imageView, attribute: .rightMargin, multiplier: 1, constant: 20).isActive = true
            NSLayoutConstraint(item: messageLabel, attribute: .centerY, relatedBy: .equal, toItem: toastyView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        }
        
        viewController.view.addSubview(toastyView)
        toastyView.show()
        toastyView.perform(#selector(hide), with: nil, afterDelay: 3.0)
    }
    
    public static func showToast(viewController: UIViewController, withSimpleImage image: UIImage?) {
        let screenSize: CGRect = UIScreen.main.bounds
        let toastyView = ToastyView()
        var imageView: UIImageView?
        
        //Position de la view ici
        toastyView.frame = CGRect(x: 10, y: screenSize.height-110 , width: 100, height: 100)
        toastyView.alpha = 0.0
        toastyView.layer.cornerRadius = 10.0
        toastyView.backgroundColor = UIColor.red.withAlphaComponent(0.6)
        toastyView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        
        if let image = image {
            imageView = UIImageView(image: image)
            imageView?.contentMode = .scaleAspectFit
            imageView?.frame = CGRect(x: 10.0, y: 10.0, width: 80.0, height: 80.0)
            toastyView.addSubview(imageView!)
            imageView?.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: toastyView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: toastyView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80).isActive = true
            NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80).isActive = true
        }
        
        viewController.view.addSubview(toastyView)
        toastyView.show()
        toastyView.perform(#selector(hide), with: nil, afterDelay: 3.0)
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
    
    //ajoutez ce que vous voulez
    public var cornerRadius: CGFloat = 10.0
    public var backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.8)
    public var messageColor: UIColor = .white
    public var messageAlignment: NSTextAlignment = .left
    public var messageNumberOfLines = 0
    
}
