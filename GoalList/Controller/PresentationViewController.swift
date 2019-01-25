//
//  PresentationViewController.swift
//  GoalList
//
//  Created by Kolten Fluckiger on 7/4/18.
//  Copyright © 2018 Kolten Fluckiger. All rights reserved.
//

import UIKit

class PresentationViewController: NSObject, UIViewControllerAnimatedTransitioning {
    
    var direction: Direction = .unknown

    func transitionDuration(using _: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        guard let presenter = transitionContext.viewController(forKey: .from) else { return }
        presenter.view.addSubview(destination.view)
//        print("HERE")
//        if direction == .forward {
//            let animator = UIViewPropertyAnimator(duration: 1.0, dampingRatio: 0.5) {
//                destination.view.frame = CGRect(
//            }
//        }
    }
}
