//
//  Goal.swift
//  GoalList
//
//  Created by Kolten Fluckiger on 7/5/18.
//  Copyright © 2018 Kolten Fluckiger. All rights reserved.
//

import CoreData
import Foundation

@objc(Goal)
class Goal: NSManagedObject, Saveable, Deletable, Updatable {

    func save() {
        do {
            try managedObjectContext?.save()
        } catch let error {
            print("error, \(error)")
        }
    }

    func fetch() {
        do {
            let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
            try managedObjectContext?.fetch(fetchRequest)
        } catch let error {
            print("Error message: " + error.localizedDescription)
        }
    }

    func updateProgress() {

        self.goalProgress += 1

        do {
            try managedObjectContext?.save()
        }
        catch let error {
            print("Error message: \(error.localizedDescription)")
        }
    }

    func delete() {
        managedObjectContext?.delete(self)
        do {
            try managedObjectContext?.save()
        }
        catch let error {
            print("Error message: \(error.localizedDescription)")
        }
    }
}