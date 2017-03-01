/*: 
 
## Intro to Generics in Swift with Bob
Full tutotiral originally published on [Medium] by Bob Lee
 - Last Update on March 1st, 2017
 - Swift 3 & iOS 10

[Medium]: https://medium.com/ios-geek-community/intro-to-generics-in-swift-with-bob-df58118a5001#.wco0otfzg
*/
//: Useless shit
let stringArray = ["1", "2", "3", "4"]
let intArray = [1,2,3,4]
let doubleArray = [1.1, 1.2, 1.3, 1.4]

func printStringFromArray(a: [String]) {
  for s in a {
    print(s)
  }
}

func printIntFromArray(a: [Int]) {
  for i in a {
    print(i)
  }
}

func printDoubleFromArray(a: [Double]) {
  for d in a {
    print(d)
  }
}


//: Creat a generic function
func savageGenerics<anything>(a: [anything]) {
}


//: Better function with generics
func printElement<T>(array: [T]) {
  for element in array {
    print(element)
  }
}

printElement(array: doubleArray)
printElement(array: intArray)
printElement(array: stringArray)

//: Non-generic struct
struct Family {
  var members = [String]()
  mutating func push(member: String) {
    members.append(member)
  }
  
  mutating func pop() -> String {
    return members.removeLast()
  }
  
}

//: Generic Struct
struct SavageFamily<T> {
  var members = [T]()
  
  mutating func push(member: T) {
    members.append(member)
  }
  mutating func pop() -> T {
    return members.removeLast()
  }
}

//: Interact with Generic Objects
var myFam = SavageFamily<String>()
myFam.members = ["Mom", "Dad", "Sister", "Bob"]
myFam.push(member: "Dog")


var numberFam = SavageFamily<Int>()
numberFam.members = [1, 2, 3, 4, 5]
numberFam.pop()



let friendFam = SavageFamily(members: ["Cash outside", "Bruh", "Troll"])
let trueFam = SavageFamily(members: [false, false, false])


//: Extension to Generics
extension SavageFamily {
  var firstElement: T? {
    if members.isEmpty {
      return nil
    } else {
      return members[0]
    }
  }
  
}

let tigerFam = SavageFamily<String>()
tigerFam.firstElement  // nil

let lionFam = SavageFamily<String>(members: ["Father", "Mother"])
lionFam.firstElement   // "Father" Optionals



//: Generic Type Constraint
func doSomething<HelloKitty>(array: [HelloKitty]) {}
func doNothing<T>(sth: T) {}


class LOL {
}

class ChildLOL: LOL {
}


func addClassOnly<T: LOL>(array: [T]) {
}


// Upcasted Explicitly
addClassOnly(array: [LOL(), LOL(), ChildLOL() as LOL, ChildLOL() as LOL])

// Upcasted Implicitly
addClassOnly(array: [LOL(), LOL(), ChildLOL(), ChildLOL()])



/*:
> Follow me on [Instagram](https://instagram.com/bobthedev) and [Facebook Page](https://facebook.com/bobthedeveloper) for personal journey and regular updates! All of my free resources available [here](https://bobleesj.gitbooks.io/bob-s-learning-journey/content/WORK.html)
*/

