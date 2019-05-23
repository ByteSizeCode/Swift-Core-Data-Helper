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
    func insert(name: String, useEntity nameOfEntity: String, useArray entityArray: inout [NSManagedObject], usingKeypathName appropriateKeyPathName: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: nameOfEntity, in: managedContext)!
        let genericItem = NSManagedObject(entity: entity, insertInto: managedContext)
        genericItem.setValue(name, forKeyPath: appropriateKeyPathName)
        
        do { //Save context and add to array
            try managedContext.save()
            entityArray.append(genericItem)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    //Updating stored data
    func updateData(forEntity: String, updateValueTo updatedValue: String, andSaveToArray entityArray: inout [NSManagedObject]){
        
        //Get managedContext, refrence to AppDelegate, and prepare fetchRequest
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "\(forEntity)")
       
        do {
            let fetched = try managedContext.fetch(fetchRequest)
            let objectUpdate = fetched.last! as! NSManagedObject
            
            //Update value
            objectUpdate.setValue(updatedValue, forKey: "name")
            
            do { //Save context
                try managedContext.save()
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
    }
    
    //Delete saved data
    func deleteData(forEntity: String){
        
        //Get managedContext, refrence to AppDelegate, and prepare fetchRequest
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "\(forEntity)")
        
        do {
            let fetched = try managedContext.fetch(fetchRequest)
            
            //Delete object
            let objectToDelete = fetched as! [NSManagedObject]
            if (objectToDelete.count != 0){ //Do not delete if nothing to delete
                managedContext.delete(objectToDelete.last!)
            }
            
            do { //Save context
                try managedContext.save()
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
    }
}
