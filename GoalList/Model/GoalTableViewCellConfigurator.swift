//
//  GoalTableViewCellConfigurator.swift
//  GoalList
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

        cell.goalLabel.text = "Goal: \(String(describing: description))"
        cell.goalTypeLabel.text = "Type: \(String(describing: goalType))"
        cell.goalPointsLabel.text = String(goalProgress)

        if goal.goalProgress == goal.goalLimit {

            let completionView = UIView(frame: cell.frame)
            let completedLabel = UILabel(frame: cell.frame)

            completionView.backgroundColor = UIColor(red: 44 / 255, green: 156 / 255, blue: 35 / 255, alpha: 0.2)
            completedLabel.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
            completedLabel.textColor = .black
            
            completionView.translatesAutoresizingMaskIntoConstraints = false
            completedLabel.translatesAutoresizingMaskIntoConstraints = false

            cell.addSubview(completionView)
            cell.addSubview(completedLabel)

            NSLayoutConstraint.activate([completionView.leadingAnchor.constraint(equalTo: cell.leadingAnchor), completionView.trailingAnchor.constraint(equalTo: cell.trailingAnchor), completionView.topAnchor.constraint(equalTo: cell.topAnchor),
                                            completionView.bottomAnchor.constraint(equalTo: cell.bottomAnchor), completedLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor), completedLabel.trailingAnchor.constraint(equalTo: cell.trailingAnchor), completedLabel.topAnchor.constraint(equalTo: cell.topAnchor),
                                            completedLabel.bottomAnchor.constraint(equalTo: cell.bottomAnchor)])

        }
        else {

        }
    }
}
