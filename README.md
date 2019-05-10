# Swift Core Data Helper

Significantly cuts down on Boilerplate Code for Core Data implementation.

## Usage:

After including the SwiftCoreDataHelper class in your project:

Create an object
```swift
let myData = SwiftCoreDataHelper()
````
Create an array to store Entity objects
```swift
var people: [NSManagedObject] = []
```
Writing data
```swift
let personName = "Harry"
myData.save(name: personName, useEntity: "Person", useArray: &people, usingKeypathName: "name")
```
Reading back saved data
```swift
myData.getData(forEntity: "Person", andSaveToArray: &people)
```
