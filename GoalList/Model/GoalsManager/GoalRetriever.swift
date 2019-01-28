//
//  GoalsRetriever.swift
//  GoalieList
//
//  Created by Kolten Fluckiger on 7/4/18.
//  Copyright © 2018 Kolten Fluckiger. All rights reserved.
//

import CoreData
import Foundation

class GoalRetriever {
    
    let managedContext: NSManagedObjectContext
    let fetchRequest: NSFetchRequest<Goal>

    init(managedContext: NSManagedObjectContext, fetchRequest: NSFetchRequest<Goal>) {
        self.managedContext = managedContext
        self.fetchRequest = fetchRequest
    }

    func executeFetch(completion: ([Goal]?) -> Void) {
        do {
            let goals = try managedContext.fetch(fetchRequest)
            completion(goals)
        } catch {
            print("Could not fetch")
            completion(nil)
        }
    }
}
