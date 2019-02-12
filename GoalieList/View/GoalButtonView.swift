//
//  ButtonView.swift
//  GoalieList
//
//  Created by Kolten Fluckiger on 7/1/18.
//  Copyright © 2018 Kolten Fluckiger. All rights reserved.
//

import UIKit

class GoalButtonView: UIButton {
    public override var isSelected: Bool {
        didSet {
            switch isSelected {
            case true:
                backgroundColor = UIColor(red: 44 / 255, green: 156 / 255, blue: 35 / 255, alpha: 1)
            case false:
                backgroundColor = UIColor(red: 58 / 255, green: 206 / 255, blue: 46 / 255, alpha: 1)
            }
        }
    }
}
