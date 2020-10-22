import Foundation

/* DAY 12
 * OPTIONALS
 */

/* HANDLING MISSING DATA
 */
/* UNWRAPPING OPTIONALS
 */

var name: String? = nil

if
    let _name = name {
    
    print("Name is \(_name) .")
} else {
    print("Name does not exist .")
}


func getUserName()
    -> String? {
    
    return "Dorothy"
}

if
    let _userName = getUserName() {
    
    print("Your username is \(_userName) .")
} else {
    print("Your username is unknown .")
}


var bestScore: Int? = nil
bestScore = 101

if
    let _bestScore = bestScore {
    
    if _bestScore > 100 {
        print("You got a high score!")
    } else {
        print("Better luck next time.")
    }
}


/* UNWRAPPING WITH GUARD
 * Using
 * guard let
 * lets you deal with problems at the start of your functions ,
 * then exit immediately .
 * This means the rest of your function is the happy path .
 */

func greet(_ name: String?) {
    
    guard let _name = name
        else {
        
        print("Please enter your name .")
        /* guard requires that we exit the current scope when it is used ,
         * which in this case means we must return from the function if it fails .
         * This is not optional : Swift won’t compile our code without the return .
         */
        return
        
    }
    
    /* NOTE
     *  Because optionals unwrapped using guard let
     * stay around after the guard finishes ,
     * we can print the unwrapped string at the end of the function .
     */
    print("Your name is \(_name)")
}

/* TIP :
 * use if let
 * if you just want to unwrap some optionals ,
 * but prefer guard let
 * if you’re specifically checking that conditions are correct before continuing .
 */


func username(for id: Int?)
    -> String {
    
    guard
        let id = id
        else {
        
        return ""
    }
    
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return ""
    }
}

let taylor =  username(for: 1989)



/* FORCE UNWRAPPING
 * A good idea is
 * to create a handful of functions and extensions
 * that isolate your force unwraps in one place .
 * This means your force unwrapping can be stored
 * near to the place where its behavior is clarified ,
 * and the vast majority of your code doesn’t need to force unwrap directly .
 */

enum Direction: CaseIterable {
    case north, south, east, west

    static func random()
        -> Direction {
        
        Direction.allCases.randomElement()!
    }
}

/* With that in place ,
 * everywhere we need to get a random direction
 * no longer needs a force unwrap .
 */

let randomDirection = Direction.random()


func describe(array: [String]?) {
    let unwrapped = array!
    print("The array has \(unwrapped.count) items.")
}
describe(array: [])



/* IMPLICITLY UNWRAPPED OPTIONALS
 * Implicitly unwrapped optionals are created by adding
 * an exclamation mark after your type name , like this :
 */

let age: Int! = nil

/* Implicitly unwrapped optionals exist
 * because sometimes a variable will start life as nil ,
 * but will always have a value before you need to use it .
 */
/* Very rare in SwiftUI .
 */



/* NIL COALESCING OPERATOR
 * The nil coalescing operator unwraps an optional
 * and returns the value inside if there is one .
 * If there isn’t a value – if the optional was nil –
 * then a default value is used instead . Either way ,
 * the result won’t be optional :
 * it will either by the value from inside the optional
 * or the default value used as a back up .
 */

let lightsaberColor: String? = "green"
let color = lightsaberColor ?? "blue"

/* NOTE
 * You can chain nil coalescing if you want to , although I don’t think it’s common :
 */
func first()
    -> String? { return "first" }


func second()
    -> String? { return "second" }


let savedData = first() ?? second() ?? ""
/* That will attempt to run first() ,
 * and if that returns nil attempt to run second() ,
 * and if that returns nil
 * then it will use an empty string .
 */

/* NOTE
 * Remember ,
 * reading a dictionary key will always return an optional ,
 * so you might want to use nil coalescing here
 * to ensure you get back a non-optional :
 */

let scores = [
    "Picard" : 800 ,
    "Data" : 7000 ,
    "Troi" : 900
]

let crusherScore = scores["Crusher"] ?? 0
let crusherScore1 = scores["Crusher" , default : 0]


let jeansNumber: Int? = nil
let jeans = jeansNumber ?? 501



/* OPTIONAL CHAINING
 * Swift’s optional chaining lets us dig through several layers of optionals
 * in a single line of code ,
 * and if any one of those layers is nil
 * then the whole line becomes nil .
 */

let names = [
    "Vincent" : "van Gogh" ,
    "Pablo" : "Picasso" ,
    "Claude" : "Monet"
]

let surnameLetter = names["Vincent"]?.first?.uppercased()

/* NOTE
 * Optional chaining makes for a very good companion to nil coalescing ,
 * because it allows you to dig through layers of optionals
 * while also providing a sensible fall back if any of the optionals are nil .
 */

let surnameLetter1 = names["Vincent"]?.first?.uppercased() ?? ""


let captains: [String]? = ["Archer", "Lorca", "Sisko"]
let lengthOfBestCaptain = captains?.last?.count


/* OPTIONAL TRY
 * There are two alternatives to
 * do, try, and catch
 * The first one is try?
 * The second one is try!
 */
/* There are advantages and disadvantages to using optional try ,
 * but it mostly centers around how important the error is to you .
 * If you want to run a function and care only that it succeeds or fails
 * – you don’t need to distinguish between the various reasons why it might fail –
 * then using optional try is a great fit ,
 * because you can boil the whole thing down to “did it work?”
 */

/* If you use
 * try
 * you must either catch the error
 * or mark your function as
 * throws
 */

func runRiskyFunction() -> String {
    return "hello world"
}


do {
    let result = try runRiskyFunction()
    print(result)
} catch {
    // it failed!
}


if
    let result = try? runRiskyFunction() {
    
    print(result)
}


/* When using try (do , try , and catch)
 * you must catch all errors that can be thrown .
 */

enum PasswordError: Error {
    case obvious
}


func checkPassword(_ password: String) throws
    -> Bool {
    
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}


do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}


/* Using try? converts a function's return value into an optional .
 */

if
    let result = try? checkPassword("password") {
    
    print("Result was \(result)")
} else {
    print("D'oh.")
}



/* FAILABLE INITIALIZERS
 * Failable initializers give us the opportunity
 * to back out of an object’s creation if validation checks fail .
 */
/* If you need your initializer to fail when it is given bad input ,
 * use init?() to make a failable initializer .
 */

var hasForcePowers = "true"
let convertedHasForcePowers = Bool(hasForcePowers)

var highestJump = "2.45"
let convertedHighestJump = Double(highestJump)



/* TYPECASTING
 * Type casting isn’t specifically frowned upon in Swift ,
 * but I would say that repeated type casting might mean
 * you’ve got an underlying problem in your code . More specifically ,
 * Swift works best when it understands what data you’re working with ,
 * and a type cast effectively says to Swift ,
 * “I know more information than you do.”
 * If you can find ways to convey that information to Swift
 * so it understand it as well ,
 * that usually works better.
 */



/* OPTIONALS SUMMARY
 */

func brewBeer(to strength: Double?) {
    guard
        let strength = strength
        else { return }
    
    print("Let's brew some beer!")
}

brewBeer(to : 5.5)



struct Dog {
    
    var name: String
    
    init?(name: String) {
        guard name == "Lassie"
        else {
            print("Sorry, wrong dog!")
            return nil
        }
        self.name = name
    }
}
let dog = Dog(name: "Fido")



//func population(of city: String)
//    -> Int? {
//
//    if city == "Paris" {
//        return 2_200_000
//    }
//
//    return nil
//}
//
//let pop = population(of : "Tokyo")! // ERROR

//let age2: Int = 20
//let allowedMessage: String? = age2 >= 21 ? "Welcome!" : nil
//let result = allowedMessage! // ERROR
