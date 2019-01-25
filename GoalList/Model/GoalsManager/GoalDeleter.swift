//
//  GoalsDeleter.swift
//  GoalList
//
//  Created by Kolten Fluckiger on 7/5/18.
//  Copyright © 2018 Kolten Fluckiger. All rights reserved.
//

import CoreData
import Foundation

class GoalDeleter {

    func executeDelete(_ goalObject: Deletable) {
        goalObject.delete()
    }
}
