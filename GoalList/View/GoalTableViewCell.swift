//
//  GoalTableViewCell.swift
//  GoalieList
//
//  Created by Kolten Fluckiger on 7/1/18.
//  Copyright © 2018 Kolten Fluckiger. All rights reserved.
//

import UIKit

// MARK: GoalTableViewCell

class GoalTableViewCell: UITableViewCell {


    @IBOutlet var goalLabel: UILabel!
    @IBOutlet var goalTypeLabel: UILabel!
    @IBOutlet var goalPointsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
