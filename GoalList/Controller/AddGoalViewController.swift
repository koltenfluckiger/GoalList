//
//  AddGoalViewController.swift
//  GoalieList
//
//  Created by Kolten Fluckiger on 7/1/18.
//  Copyright © 2018 Kolten Fluckiger. All rights reserved.
//

// MARK: AddGoalViewController

import UIKit

class AddGoalViewController: UIViewController {
    
    // MARK: Outlets

    @IBOutlet weak var mainView: UIView! {
        didSet {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            mainView.addGestureRecognizer(tapGesture)
        }
    }

    @IBOutlet var goalTextView: UITextView!
    @IBOutlet var buttonStackView: UIStackView!
    @IBOutlet var shortTermButton: GoalButtonView!
    @IBOutlet var longTermButton: GoalButtonView!
    @IBOutlet var nextButton: UIButton!

    //  MARK: Properties

    private var goalType: GoalType?
    var placeholderVisiblity: Visibility = .visible

    //  MARK: Life Cycle Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        goalTextView.delegate = self
        nextButton.attachKeyboardObserver()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nextButton.detachKeyboardObserver()
    }

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == ADD_POINTS {
            let destinationVC = segue.destination as! PointsViewController
            destinationVC.initData(description: goalTextView.text, type: goalType!)
        }
    }

    //  MARK: Functions

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    // MARK: Outlet Functions

    @IBAction func backButton(_: UIButton) {
        goalTextView.resignFirstResponder()
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

    @IBAction func shortTermGoalButton(_: UIButton) {
        shortTermButton.isSelected = true
        longTermButton.isSelected = false
        goalType = .shortTerm
    }

    @IBAction func longTermGoalButton(_: UIButton) {
        longTermButton.isSelected = true
        shortTermButton.isSelected = false
        goalType = .longTerm
    }

    @IBAction func nextButton(_: UIButton) {
        if placeholderVisiblity == .visible {
            goalTextView.shake()
        } else if goalType == nil {
            buttonStackView.shake()
        } else {
            performSegue(withIdentifier: ADD_POINTS, sender: self)
        }
    }
}
