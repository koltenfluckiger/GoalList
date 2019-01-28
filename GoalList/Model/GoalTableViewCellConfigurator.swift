//
//  GoalTableViewCellConfigurator.swift
//  GoalieList
//
//  Created by Kolten Fluckiger on 7/5/18.
//  Copyright © 2018 Kolten Fluckiger. All rights reserved.
//

import Foundation
import UIKit

class GoalTableViewCellConfigurator {

    func configure(_ cell: GoalTableViewCell, with goal: Goal) {

        guard let description = goal.goalDescription else { return }
        guard let goalType = goal.goalType else { return }
        let goalProgress = goal.goalProgress
        let goalLimit = goal.goalLimit

        cell.goalLabel.text = "Goal: \(String(describing: description))"
        cell.goalTypeLabel.text = "Type: \(String(describing: goalType))"
        cell.goalPointsLabel.text = String(goalProgress) + "/\(goalLimit)"

        if goal.goalProgress == goal.goalLimit {
            
            let completionView = UIView(frame: cell.frame)
            let completedLabel = UILabel(frame: cell.frame)

            completedLabel.text = "Goal Complete"

            completionView.backgroundColor = UIColor(red: 44 / 255, green: 156 / 255, blue: 35 / 255, alpha: 0.4)
            completedLabel.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
            completedLabel.textColor = .black

            completionView.translatesAutoresizingMaskIntoConstraints = false
            completedLabel.translatesAutoresizingMaskIntoConstraints = false

            cell.addSubview(completionView)
            cell.insertSubview(completedLabel, aboveSubview: completionView)

            NSLayoutConstraint.activate([completionView.leadingAnchor.constraint(equalTo: cell.leadingAnchor), completionView.trailingAnchor.constraint(equalTo: cell.trailingAnchor), completionView.topAnchor.constraint(equalTo: cell.topAnchor),
                completionView.bottomAnchor.constraint(equalTo: cell.bottomAnchor)])
            NSLayoutConstraint.activate([completedLabel.centerXAnchor.constraint(equalTo: completionView.centerXAnchor), completedLabel.centerYAnchor.constraint(equalTo: completionView.centerYAnchor)])
        }
    }
}
