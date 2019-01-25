//
//  UIButtonExtension.swift
//  GoalList
//
//  Created by Kolten Fluckiger on 7/3/18.
//  Copyright © 2018 Kolten Fluckiger. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func attachKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    func detachKeyboardObserver() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    @objc func keyboardWillChange(_ notification: Notification) {
        guard let keyboardInformation = notification.userInfo else { return }
        guard let endingKeyboardFrame = keyboardInformation[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        guard let startingKeyboardFrame = keyboardInformation[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect else { return }
        let animationDuration = keyboardInformation[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0.25
        let curve = keyboardInformation[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt ?? 3
        var deltaY = endingKeyboardFrame.origin.y - startingKeyboardFrame.origin.y

        if #available(iOS 11.0, *) {
            let bottomSafeMargin = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
            if endingKeyboardFrame.origin.y < startingKeyboardFrame.origin.y {
                deltaY += bottomSafeMargin
            } else {
                deltaY -= bottomSafeMargin
            }
        }

        UIView.animateKeyframes(withDuration: animationDuration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: { [weak self] in
            self?.frame.origin.y += deltaY
        })
    }
}
