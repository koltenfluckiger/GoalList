//
//  AddGoalViewControllerExtension.swift
//  GoalList
//
//  Created by Kolten Fluckiger on 7/1/18.
//  Copyright © 2018 Kolten Fluckiger. All rights reserved.
//

import Foundation
import UIKit

extension AddGoalViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView == goalTextView {
            let currentText = goalTextView.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let changedText = currentText.replacingCharacters(in: stringRange, with: text)
            return changedText.count <= 40
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
}
