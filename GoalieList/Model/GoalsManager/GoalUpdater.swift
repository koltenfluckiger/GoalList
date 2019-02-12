//
//  GoalUpdater.swift
//  GoalieList
//
//  Created by Kolten Fluckiger on 8/17/18.
//  Copyright © 2018 Kolten Fluckiger. All rights reserved.
//

import Foundation


class GoalUpdater {
    
    func excuteUpdate(on goal: Updatable){
        goal.updateProgress()
    }
}
