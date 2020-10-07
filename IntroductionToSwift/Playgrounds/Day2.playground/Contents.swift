import Foundation

/* DAY 2
 * Arrays
 * Dictionaries
 * Sets
 * Enums
 */


/* ARRAYS :
 */

func describe(array: [String]?) {
    let unwrapped = array!
    
    print("The array has \(unwrapped.count) items .")
}

describe(array: [])



/* SETS :
*/
// To create a set you must pass in an array of items :
let colors = Set(["red" , "blue" , "yellow"])

// If you try to insert a duplicate item into a set, the duplicates get ignored :
let cMYKColors = Set(["cyan" , "cyan" , "magenta" , "yellow" , "black"])


/* TUPLES :
*/

var name = (first : "Taylor" , last : "Swift")
name.first
name.0
name.last
name.1

// name = (first : "Maisie" , age : 22)
// ERROR : error: cannot assign value of type '(first: String, age: Int)' to type '(first: String, last: String)'


/* Arrays vs Sets vs Tuples
*/
/* If you need a specific , fixed collection of related values
 * where each item has a precise position or name ,
 * you should use a tuple .
 */
/* If you need a collection of values that must be unique
 * or you need to be able to check
 * whether a specific item is in there extremely quickly ,
 * you should use a set .
 */
/* If you need a collection of values that can contain duplicates ,
 * or the order of your items matters ,
 * you should use an array .
 */


/* DICTIONARIES :
 */

let heights: [String : Int] = [
    "Taylor Swift" : 178 ,
    "Dorothy Gale" : 161
]

heights["Taylor Swift"]
heights["Dorothy Gale"]

/* DICTIONARY DEFAULT VALUES :
*/

heights["Ozma of Oz" , default : 0]


/* CREATING EMPTY COLLECTIONS :
 */
// Empty Dictionary :
var names: [String : String] = [String : String]()
var rainbowColors: [String : String] = Dictionary<String , String>()

// Empty Array :
var scores: [Int] = [Int]()
var highScores: [Int] = Array<Int>()

// Empty Set :
var words = Set<String>()


/* ENUMERATIONS
 * Enumerations are a way of defining groups of related values
 * in a way that makes them easier to use .
 */

enum Result {
    case failure
    case success
}

let result = Result.success


/* ENUM ASSOCIATED VALUES
 * As well as storing a simple value ,
 * enums can also store associated values attached to each case .
 * This lets you attach additional information to your enums
 * so they can represent more nuanced data .
 */

enum Activities {
    case bored
    case talking(topic: String)
    case running(destination: String)
}

let myGentleRun = Activities.running(destination : "San Giovanni Beach")


/* ENUM RAW VALUES
 * Sometimes you need to be able to assign values to enums so they have meaning .
 * You can give each case specific values if you want .
 * Integer raw values count from 0 automatically .
 * Raw values let us create enum values dynamically .
 * Raw values let us give meaning to enum cases .
 *
 * Associated values attach extra data to an enum case ;
 * raw values are underlying data types for each case .
 *
 * You can attach raw values to enums
 * so they can be created from integers or strings ,
 * or you can add associated values to store additional information about each case .
 */

enum Planets: Int {
    case Mercury = 1
    case Venus
    case Earth
    case Mars
}

let planetEarth = Planets.init(rawValue: 3)



/* ARRAYS
 */

var songs: Array<String> = ["Shake it Off", "You Belong with Me", "Back to December"]
type(of : songs) // This is a special command in the playground that will print out the data type of any variable .

var array1: [Int] = []
var array2 = [Int]()
var array3 = Array<Int>()

array1 = [1 , 2 , 3]
array2 = [4 , 5]
array3 = array1 + array2



/* DICTIONARIES
 */

let planets = [1 : "Mercury" , 2 : "Venus"]
let venus = planets[2 , default : "Planet X"]

let capitals = ["England" : "London" , "Wales" : "Cardiff"]
let scotlandCapital = capitals["Scotland"]

var favoriteColors = Dictionary<String , String>()
var states = Set<String>()
var answers = [Bool]()
var scores1 = Array<Int>()



/* CONDITIONAL STATEMENTS
 */


/* TERNARY OPERATOR
 */

var averagePages: Double = 10.01
print(averagePages == 10 ? "Success" : "Failure")
/* OLIVIER :
 * 10 is read as a Double here .
 */



/* LOOPS
 */
// 1. Closed Range operator :
for number in 1...5 {
    print(number * number)
}


var songText: String = "Fakers gonna"

for _ in 1...5 {
    
    songText += " fake ✊"
}

songText += " 👊"

print(songText)

// 2. Half open range operator

// 3. Looping over arrays :

var numbers: [Int] = [1 , 2 , 3 , 4 , 5]

for number in numbers {
    print(number)
}

var letters: [String] = ["a" , "b" , "c" , "d" , "e"]

for index in 0..<5 {
    print("Number \(numbers[index])")
    print("Letter \(letters[index])")
}


var humans = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for index in 0..<humans.count {
    var string = "\(humans[index]) gonna"
    
    for _ in 0..<actions.count {
        string += " \(actions[index])"
    }
    
    print(string)
}

// 4. while loops :
/* while loops work best
 * when you are using unknown data ,
 * such as downloading things from the internet ,
 * reading from a file such as XML ,
 * looking through user input , and so on .
 * This is because you only know when to stop the loop
 * after you have run it a sufficient number of times .
 */

/* break
 * breaking out of a loop stops execution immediately .
 */
/* Using break by itself exits the current loop only .
 */

var counter = 0

while true {
    print("Counter is now \(counter)")
    counter += 1

    if counter == 5 {
        break
    }
}

/* continue
 * continuing a loop only exits the current iteration of the loop
 * – it will jump back to the top of the loop and pick up from there .
 */

var songs2 = ["Shake it Off" , "You Belong with Me" , "Look What You Made Me Do"]

for song in songs2 {
    if song == "You Belong with Me" {
        continue
    }

    print("My favorite song is \(song)")
}



let count = 1...3 // OLIVIER : You can store a range in a variable .
for _ in count {
    print("There's no place like home.")
}


/* We use loop labels to break out of specific loops .
 */
/* You may have as many labeled loops as you need .
 */

outer : for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("Product is \(product)")
        break outer
    }
}


/* SWITCH CASE
 * In the most basic form of a switch/case
 * you tell Swift what variable you want to check ,
 * then provide a list of possible cases for that variable .
 * Swift will find the first case that matches your variable ,
 * then run its block of code .
 * When that block finishes , Swift exits the whole switch/case block .
 */
/* Switch statements help us by focusing on one specific check ,
 * rather than many possible checks .
 */
/* Code from the following case will be run if you use fallthrough .
 */

var age = 18
switch age {
case 0...8:
    fallthrough
case 9..<18:
    print("You're still a minor")
default:
    print("You're an adult")
}


