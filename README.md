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
Write data as follows
```swift
let personName = "Harry"
myData.save(name: personName, useEntity: "Person", useArray: &people, usingKeypathName: "name")
```
At a later time, fetch saved data as follows (e.g. a good time to do this may be on app launch in ViewDidLoad)
```swift
myData.getData(forEntity: "Person", andSaveToArray: &people)
```
