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
    //Factoriser le code si possible
    
    //Pour tester
    //Créer un projet
    //Faite un glisser deposer du framework (qui se trouve dans le dossier products que tu vois a gauche dans le projet sur xcode)
    //Ajouter 3 boutons et mettre les ibactions
    //Appeler la fonction ToastyView.showToast(.....)
    //Ne pas oublier de mettre dans le projet dans le Embeded Binaries le framework
    
    static var toastyView = ToastyView()
    
    public static func showToast(viewController: UIViewController, withSimpleMessage message: String?) {
        initToastyView(forToast: 1, viewController)
        
        if let message = message {
            createMessage(message, forToast:1, with: nil)
        }
        
        enableToast(viewController)
    }
    
    public static func showToast(viewController: UIViewController, withMessage message: String?, andImage image: UIImage?) {
        var imageView: UIImageView?
        initToastyView(forToast: 2, viewController)
        
        if let image = image {
            imageView = createImage(image, forToast: 1)
        }
        
        if let message = message {
            createMessage(message, forToast: 2, with: imageView)
        }
        
        enableToast(viewController)
    }
    
    public static func showToast(viewController: UIViewController, withSimpleImage image: UIImage?) {
        initToastyView(forToast: 3, viewController)
        
        if let image = image {
            _ = createImage(image, forToast: 3)
        }
        
        enableToast(viewController)
    }
    
    static func initToastyView(forToast type: Int, _ viewController: UIViewController?) {
        let screenSize: CGRect = UIScreen.main.bounds
        toastyView.checkIsActive()
        
        //Position de la view ici
        if (type == 1), let viewController = viewController {
            toastyView.frame = CGRect(x: 10, y: screenSize.height-60 , width: viewController.view.frame.size.width - 20, height: 50)
        } else if (type == 2), let viewController = viewController {
            toastyView.frame = CGRect(x: 10, y: screenSize.height-110 , width: viewController.view.frame.size.width - 20, height: 100)
        } else {
            toastyView.frame = CGRect(x: 10, y: screenSize.height-110 , width: 100, height: 100)
        }
        toastyView.alpha = 0.0
        toastyView.layer.cornerRadius = 10.0
        toastyView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        toastyView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
    }
    
    static func createMessage(_ message: String, forToast type: Int, with imageView: UIImageView?) {
        let ml = UILabel()
        ml.text = message
        ml.numberOfLines = 0
        ml.textAlignment = .center
        ml.lineBreakMode = .byTruncatingTail
        ml.backgroundColor = UIColor.clear
        toastyView.addSubview(ml)
        ml.translatesAutoresizingMaskIntoConstraints = false
        
        if (type == 1) {
            NSLayoutConstraint(item: ml, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: toastyView, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: ml, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: toastyView, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: ml, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: toastyView.frame.width - 40).isActive = true
            NSLayoutConstraint(item: ml, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 30).isActive = true
        } else if let imageView = imageView{
            NSLayoutConstraint(item: ml, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: toastyView.frame.width - 90).isActive = true //90 parce que 80 taille image et 10 en plus comme ça pour pas coller
            NSLayoutConstraint(item: ml, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 80).isActive = true
            NSLayoutConstraint(item: ml, attribute: .leftMargin, relatedBy: .equal, toItem: imageView, attribute: .rightMargin, multiplier: 1, constant: 20).isActive = true
            NSLayoutConstraint(item: ml, attribute: .centerY, relatedBy: .equal, toItem: toastyView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        }
    }
    
    static func createImage(_ image: UIImage, forToast type: Int) -> UIImageView {
        let iv = UIImageView(image: image)
        iv.contentMode = .scaleAspectFit
        iv.frame = CGRect(x: 10.0, y: 10.0, width: 80.0, height: 80.0)
        toastyView.addSubview(iv)
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        if (type == 1) {
            NSLayoutConstraint(item: iv, attribute: .leftMargin, relatedBy: .equal, toItem: toastyView, attribute: .leftMargin, multiplier: 1, constant: 10).isActive = true
            NSLayoutConstraint(item: iv, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: toastyView, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: iv, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 80).isActive = true
            NSLayoutConstraint(item: iv, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 80).isActive = true
        } else {
            NSLayoutConstraint(item: iv, attribute: .centerX, relatedBy: .equal, toItem: toastyView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: iv, attribute: .centerY, relatedBy: .equal, toItem: toastyView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: iv, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80).isActive = true
            NSLayoutConstraint(item: iv, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80).isActive = true
        }
        return iv
    }
    
    static func enableToast(_ viewController: UIViewController) {
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
    
    func checkIsActive() {
        if self.alpha > 0.0 {
            self.removeFromSuperview()
        }
        ToastyView.toastyView = ToastyView()
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
