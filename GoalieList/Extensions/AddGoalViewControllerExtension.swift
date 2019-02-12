//
//  AddGoalViewControllerExtension.swift
//  GoalieList
//
//  Created by Kolten Fluckiger on 7/1/18.
//  Copyright © 2018 Kolten Fluckiger. All rights reserved.
//

import Foundation
import UIKit

extension AddGoalViewController: UITextViewDelegate, UIViewControllerTransitioningDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView == goalTextView {
            let currentText = goalTextView.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let changedText = currentText.replacingCharacters(in: stringRange, with: text)
            return changedText.count <= 35
        }
        return true
    }

    func textViewDidBeginEditing(_: UITextView) {
        if placeholderVisiblity == .visible {
            placeholderVisiblity = .invisible
            goalTextView.text = nil
            goalTextView.textColor = UIColor.black
        }
    }

    func textViewDidEndEditing(_: UITextView) {
        if goalTextView.text.isEmpty {
            placeholderVisiblity = .visible
            goalTextView.text = "What is your goal?"
            goalTextView.textColor = UIColor.lightGray
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == ADD_POINTS {
            let pointsViewController = segue.destination as! PointsViewController
            pointsViewController.transitioningDelegate = self
            pointsViewController.initData(description: goalTextView.text, type: goalType!)
        }
    }
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresenterViewController()
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissalViewContoller()
    }
}
