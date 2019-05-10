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
        myData.save(name: seatColor, useEntity: "Car", useArray: &cars, usingKeypathName: "seatColor")
        
        //Write to CoreData
        let personName = "Harry"
        myData.save(name: personName, useEntity: "Person", useArray: &people, usingKeypathName: "name")
        
        
        //Display data (for demonstration purposes only)
        textView.text = "" //clear textfield
        myData.getData(forEntity: "Car", andSaveToArray: &cars)
        textView.text.append("Data from Car entity:\n")
        for element in cars {
             textView.text.append("\(element)\n\n\n")
        }
        myData.getData(forEntity: "Person", andSaveToArray: &people)
        textView.text.append("\n\nData from Person entity:\n")
        for element in people {
             textView.text.append("\(element)\n\n\n")
        }
    }
}
