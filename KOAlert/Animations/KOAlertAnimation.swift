//
//  KOAlertAnimation.swift
//  KOAlert
//
//  Created by Kaan Ozdemir on 12.09.2021.
//  Copyright © 2021 Kaan Ozdemir. All rights reserved.
//

import UIKit

class KOAlertAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool
    
    init(isPresenting: Bool) {
        self.isPresenting = isPresenting
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return isPresenting ? 0.3 : 0.2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        isPresenting ? self.presentAnimateTransition(using: transitionContext) : self.dismissAnimateTransition(using: transitionContext)
    }
    
    func presentAnimateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        let alertController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! KOAlertController
//        let containerView = transitionContext.containerView
//
//        alertController.overlayView.alpha = 0
//
//        if alertController.isPresenting {
//            alertController.view.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//        } else {
//            alertController.view.transform = CGAffineTransform(translationX: 0, y: alertController.view.frame.height)
//        }
//
//        containerView.addSubview(alertController.view)
//
//        UIView.animate(withDuration: 0.25,
//                       animations: {
//                        alertController.overlayView.alpha = 1.0
//                        if alertController.isPresenting {
//                            alertController.alertView.alpha = 1.0
//                            alertController.alertView.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
//                        } else {
//                            let bounce = alertController.alertView.frame.height / 480 * 10.0 + 10.0
//                            alertController.alertView.transform = CGAffineTransform(translationX: 0, y: -bounce)
//                        }
//                       },
//                       completion: { finished in
//                        UIView.animate(withDuration: 0.2,
//                                       animations: {
//                                        alertController.view.transform = CGAffineTransform.identity
//                                       },
//                                       completion: { finished in
//                                        if (finished) {
//                                            transitionContext.completeTransition(true)
//                                        }
//                                       })
//                       })
    }
    
    func dismissAnimateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    }
}
