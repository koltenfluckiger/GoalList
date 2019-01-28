//
//  PointsViewController.swift
//  GoalieList
//
//  Created by Kolten Fluckiger on 7/4/18.
//  Copyright © 2018 Kolten Fluckiger. All rights reserved.
//

import CoreData
import UIKit

// MARK: PointsViewController

class PointsViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var mainView: UIView! {
        didSet {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            mainView.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    @IBOutlet var pointsTextField: UITextField!
    @IBOutlet var addGoalButton: UIButton!

    
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description: String, type: GoalType) {
        goalDescription = description
        goalType = type
    }

    // MARK: Life Cycle Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        addGoalButton.attachKeyboardObserver()
        pointsTextField.delegate = self
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        addGoalButton.detachKeyboardObserver()
    }

    // MARK: Functions

    func saveGoal() {
        
        guard let points = Int32(pointsTextField.text!) else { return }
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Goal", in: context)

        let goal = Goal(entity: entity!, insertInto: context)

        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalLimit = points
        goal.goalProgress = Int32(0)

        let goalSaver = GoalSaver(goalObject: goal)
        goalSaver.executeSave()
        
        performSegue(withIdentifier: "backHome", sender: self)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    // MARK: Outlet Functions

    @IBAction func addGoalButton(_: UIButton) {
        if pointsTextField.text == nil || pointsTextField.text == "" {
            pointsTextField.shake()
        } else {
            saveGoal()
        }
    }

    @IBAction func backButton(_: UIButton) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
