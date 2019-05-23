# Swift Core Data Helper

Significantly cuts down on boilerplate code for Core Data implementation.

## Usage:

After including the SwiftCoreDataHelper class in your project:

Create a refrence to the SwiftCoreDataHelper class
```swift
let myData = SwiftCoreDataHelper()
````
Create an array to keep track of your Entity objects
```swift
var people: [NSManagedObject] = []
```
Write data to an entity you previously created in your xcdatamodeld file as follows
```swift
let personName = "Harry"
myData.insert(name: personName, useEntity: "Person", useArray: &people, usingKeypathName: "name")
```
At a later time, fetch data saved in an entity as follows (e.g. a good time to do this may be on app launch in ViewDidLoad)
```swift
myData.getData(forEntity: "Person", andSaveToArray: &people)
```
Update data in an entity as follows
```swift
let otherName = "Tom"
myData.updateData(forEntity: "Person", updateValueTo: otherName, andSaveToArray: &people)
```

Remove an entity entirely as follows
```swift
myData.deleteData(forEntity: "Person")
```
