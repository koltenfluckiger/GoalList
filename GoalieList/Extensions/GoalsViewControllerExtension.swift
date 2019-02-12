//
//  GoalsViewController.swift
//  GoalieList
//
//  Created by Kolten Fluckiger on 7/1/18.
//  Copyright © 2018 Kolten Fluckiger. All rights reserved.
//

import Foundation
import UIKit

// MARK: GoalsViewControllerExtension

extension GoalsViewController: UITableViewDelegate, UITableViewDataSource, UIViewControllerTransitioningDelegate {
    

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return goals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellConfigurator = GoalTableViewCellConfigurator()
        let cell = tableView.dequeueReusableCell(withIdentifier: GOAL_TABLEVIEW_CELL, for: indexPath) as! GoalTableViewCell
        let goal = goals[indexPath.item]
        cellConfigurator.configure(cell, with: goal)
        return cell
    }

    func tableView(_: UITableView, canEditRowAt _: IndexPath) -> Bool {
        return true
    }

    func tableView(_: UITableView, editingStyleForRowAt _: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let chosenGoal = self.goals[indexPath.row]
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { [weak self] _, indexPath in

            guard let self = self else { return }
            let goalDeleter = GoalDeleter()

            goalDeleter.executeDelete(self.goals[indexPath.item])
            self.goals.remove(at: indexPath.item)

            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        if chosenGoal.goalProgress == chosenGoal.goalLimit {
            return [deleteAction]
        }

        let addAction = UITableViewRowAction(style: .normal, title: "ADD 1") { [weak self] _, indexPath in

            guard self == self else { return }
            
            if chosenGoal.goalProgress < chosenGoal.goalLimit {
                let goalUpdater = GoalUpdater()
                goalUpdater.excuteUpdate(on: chosenGoal)
            }

            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        addAction.backgroundColor = #colorLiteral(red: 0.961445272, green: 0.650790751, blue: 0.1328578591, alpha: 1)
        
        return [deleteAction, addAction]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ADD_GOAL {
            let addGoalViewController = segue.destination as! AddGoalViewController
            addGoalViewController.transitioningDelegate = self
        }
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresenterViewController()
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissalViewContoller()
    }
}
