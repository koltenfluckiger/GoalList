//
//  GoalTableViewCell.swift
//  GoalList
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
