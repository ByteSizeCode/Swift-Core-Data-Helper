//
//  SwiftCoreDataHelper.swift
//  SwiftCoreDataHelper
//
//  Created by Isaac Raval on 5/9/19.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

import UIKit
import CoreData

class SwiftCoreDataHelper {
    
    //Get saved data
    func getData(forEntity: String, andSaveToArray entityArray: inout [NSManagedObject]) {
        
        //Get managedContext, refrence to AppDelegate, and prepare fetchRequest
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "\(forEntity)")
        
        //Get saved data
        do {
            entityArray = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    //Save data
    func save(name: String, useEntity nameOfEntity: String, useArray entityArray: inout [NSManagedObject], usingKeypathName appropriateKeyPathName: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: nameOfEntity, in: managedContext)!
        let genericItem = NSManagedObject(entity: entity, insertInto: managedContext)
        genericItem.setValue(name, forKeyPath: appropriateKeyPathName)
        
        do {
            try managedContext.save()
            entityArray.append(genericItem)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
