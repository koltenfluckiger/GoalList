//
//  CoreDataStorage.swift
//  GoalieList
//
//  Created by Kolten Fluckiger on 7/3/18.
//  Copyright © 2018 Kolten Fluckiger. All rights reserved.
//

import CoreData
import Foundation

class GoalSaver {
    
    let goalObject: Saveable

    init(goalObject: Saveable) {
        self.goalObject = goalObject
    }

    func executeSave() {
        goalObject.save()
    }
}
