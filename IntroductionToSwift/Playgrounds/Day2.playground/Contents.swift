import Foundation

/* DAY 2
 * Arrays
 * Dictionaries
 * Sets
 * Enums
 */


/* ARRAYS :
 */



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
