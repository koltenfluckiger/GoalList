//
//  ViewController.swift
//  GoalieList
//
//  Created by Kolten Fluckiger on 7/1/18.
//  Copyright © 2018 Kolten Fluckiger. All rights reserved.
//

import CoreData
import UIKit

// MARK: GoalsViewController

class GoalsViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var goalTableView: UITableView!
    @IBOutlet weak var welcomeStackView: UIStackView!
    
    // MARK: Variables
    internal var goals = [Goal]() {
        didSet {
            if goals.count > 0 {
                goalTableView.isHidden = false
            }
            else {
                goalTableView.isHidden = true
            }
        }
    }

    // MARK: Life Cycle Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        goalTableView.delegate = self
        goalTableView.dataSource = self
        goalTableView.register(UINib(nibName: "GoalTableViewCell", bundle: nil), forCellReuseIdentifier: GOAL_TABLEVIEW_CELL)

        NotificationCenter.default.addObserver(self, selector: #selector(self.displayConfetti), name: NSNotification.Name(GOAL_DID_COMPLETE), object: nil)

        self.getGoals()
    }

    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(GOAL_DID_COMPLETE), object: nil)
    }

    // MARK: Functions

    @objc func displayConfetti() {
        let confettiView = ConfettiView()
        confettiView.frame = self.view.frame
        self.view.addSubview(confettiView)
        confettiView.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate([confettiView.topAnchor.constraint(equalTo: self.view.topAnchor), confettiView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor), confettiView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor), confettiView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor), confettiView.heightAnchor.constraint(equalTo: self.view.heightAnchor), confettiView.widthAnchor.constraint(equalTo: self.view.widthAnchor)])

        let animator = UIViewPropertyAnimator(duration: 3.0, curve: .easeOut, animations: {
            confettiView.alpha = 0
        })
        animator.addCompletion {_ in 
            confettiView.removeFromSuperview()
        }
        animator.startAnimation()
    }

    private func getGoals() {
        let context = appDelegate.persistentContainer.viewContext
        let fetchResult = NSFetchRequest<Goal>(entityName: "Goal")
        let goalRetriever = GoalRetriever(managedContext: context, fetchRequest: fetchResult)

        goalRetriever.executeFetch(completion: { [weak self] goals in
            guard let self = self else {return}
            guard let goals = goals else { return }
            self.goals = goals
        })
    }

    // MARK: Outlet Actions

    @IBAction func addButton(_: UIButton) {
        self.performSegue(withIdentifier: ADD_GOAL, sender: self)
    }
}
