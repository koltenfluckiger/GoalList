//
//  PointsViewControllerExtension.swift
//  GoalieList
//
//  Created by Kolten Fluckiger on 7/4/18.
//  Copyright © 2018 Kolten Fluckiger. All rights reserved.
//

import Foundation
import UIKit

extension PointsViewController: UITextFieldDelegate, UIViewControllerTransitioningDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == pointsTextField {
            let currentText = pointsTextField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let changedText = currentText.replacingCharacters(in: stringRange, with: string)
            return changedText.count <= 3
        }
        return true
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresenterViewController()
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissalViewContoller()
    }

}
