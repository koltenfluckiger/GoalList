//
//  DismissalViewController.swift
//  GoalList
//
//  Created by Kolten Fluckiger on 1/27/19.
//  Copyright © 2019 Kolten Fluckiger. All rights reserved.
//

import Foundation
import UIKit

class DismissalViewContoller: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let origin = transitionContext.viewController(forKey: .to) else {return}
        let containerView = transitionContext.containerView
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        
        let animator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.7, animations: {
            containerView.window?.layer.add(transition, forKey: kCATransition)
            containerView.addSubview(origin.view)
        })
        animator.addCompletion { (finished) in
            transitionContext.completeTransition(true)
        }
        
        animator.startAnimation()
    }
}
