//
//  ViewController.swift
//  SwiftCoreDataHelper
//
//  Created by Isaac Raval on 5/9/19.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    let myData = SwiftCoreDataHelper() //Create object/refrence
    var cars: [NSManagedObject] = [] //Array of NSManagedObjects for Car entity
    var people: [NSManagedObject] = [] //Array of NSManagedObjects for Person entity
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Read saved data from CoreData
        myData.getData(forEntity: "Car", andSaveToArray: &cars)
        myData.getData(forEntity: "Person", andSaveToArray: &people)
        
        //Write to CoreData
        let seatColor = "The Seats Are Blue"
        myData.insert(name: seatColor, useEntity: "Car", useArray: &cars, usingKeypathName: "seatColor")
        
        //Write to CoreData
        let personName = "Harry"
        myData.insert(name: personName, useEntity: "Person", useArray: &people, usingKeypathName: "name")
        
        //Display data (for demonstration purposes only)
        showObjectsStored_PersonEntity()
        showObjectsStored_CarEntity()
        
        //Appending this for clarity
        textView.text.append("\n\nChanged:\n")
        
        //Update data
        let otherName = "Tom"
        myData.updateData(forEntity: "Person", updateValueTo: otherName, andSaveToArray: &people)
        
        //Display change
        showObjectsStored_PersonEntity()
        
        //Appending this for clarity
        textView.text.append("\n\nDeleted:\n")
        
        //Delete data
        myData.deleteData(forEntity: "Person")
        
        //Display change
        showObjectsStored_PersonEntity()
    }
}

//Helper methods
extension ViewController {
    func showObjectsStored_PersonEntity() {
        textView.text.append("\n\nData from Person entity:\n")
        textView.text.append("\(people.last!)\n\n\n")
    }
    
    func showObjectsStored_CarEntity() {
        textView.text.append("Data from Car entity:\n")
        textView.text.append("\(cars.last!)\n\n\n")
    }
}
