import UIKit

/* DAY 14
 * SWIFT REVIEW DAY 2
 */

/* FUNCTIONS
 */
// Running throwing functions :
// Swift won't let you run an error-throwing function by accident .
// If any errors are thrown , execution immediately jumps to the catch block .
// You can call as many throwing functions inside a do block as you like .
// Throwing functions must be called using try .


/* VARIADIC FUNCTIONS
 */

func play(games: String...) {
    for game in games {
        print("Let's play \(game)!")
    }
}

play(games : "Chess")



/* INOUT PARAMETERS
 */
// Regular parameters are passed into functions as constants .
// Inout parameters must be variables .
// Changing Inout parameters inside a function changes them outside too .
// You can pass several parameters as inout if you want .
// Inout parameters work in all types of functions, including throwing ones .
// Inout parameters must be passed in using &
// Inout parameters are marked using the inout keyword .

func paintWalls(tastefully: Bool ,
                color: inout String) {
    
    if tastefully {
        color = "cream"
    } else {
        color = "tartan"
    }
}

var color = ""
paintWalls(tastefully : true ,
           color : &color)



/* OPTIONALS
 */

func getHaterStatus(weather: String)
    -> String? {
    
    if weather == "sunny" {
        return nil
    } else  {
        return "Hate"
    }
}

var status: String?
status = getHaterStatus(weather: "rainy")


func takeHaterAction(status: String) {
    if status == "Hate" {
        print("• hating")
    }
}


// takeHaterAction(status : status) // ERROR : Value of optional type 'String?' must be unwrapped to a value of type 'String' .
// Optional unwrapping does two things at the same time :
if
    let _status = status { // 1. checks whether an optional has a value , and if so ...
    takeHaterAction(status : _status) // 2. unwraps it into a non-optional type then runs a code block .
}



func yearAlbumReleased(name: String)
    -> Int? {
    
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    if name == "Speak Now" { return 2010 }
    if name == "Red" { return 2012 }
    if name == "1989" { return 2014 }

    // return 0
    return nil
}

/* Now that it returns nil ,
 * we need to unwrap the result using if let
 * because we need to check whether a value exists or not .
 */

var year: Int? = yearAlbumReleased(name : "Red")

if year == nil {
    print("There was an error")
} else {
    print("It was released in \(year)")
}
/* This code doesn't use
 * if let
 * to unwrap that optional .
 * As a result , it will print out the following :
 * "It was released in Optional(2012)"
 * – probably not what we wanted !
 */

if let _year = year {
    print("Unwrapped \(_year)")
}


//Force unwrapping optionals

print("Force unwrapped : \(year!)")


/* Implicitly unwrapped optionals
 * An implicitly unwrapped optional might contain a value , or might not .
 * But it does not need to be unwrapped before it is used .
 * Swift won't check for you , so you need to be extra careful .
 * Example: String! might contain a string, or it might contain nil
 * – and it's down to you to use it appropriately .
 * It is like a regular optional ,
 * but Swift lets you access the value directly without the unwrapping safety .
 * If you try to do it , it means you know there’s a value there
 * – but if you’re wrong your app will crash .
 */
/* The main times you're going to meet implicitly unwrapped optionals is
 * when you're working with user interface elements in UIKit on iOS or AppKit on macOS .
 * These need to be declared up front , but you can't use them until they have been created
 * – and Apple likes to create user interface elements at the last possible moment
 * to avoid any unnecessary work.
 */



/* 1. OPTIONAL CHAINING
 */

func albumReleased(year: Int)
-> String? {
    
    switch year {
    case 2006 : return "Taylor Swift"
    case 2008 : return "Fearless"
    case 2010 : return "Speak Now"
    case 2012 : return "Red"
    case 2014 : return "1989"
    default : return nil
    }
}

let album = albumReleased(year : 2006) // returns "The album is Optional("Taylor Swift")"
print("The album is \(album)") // Prints : The album is Optional("Taylor Swift")

let albumOC = albumReleased(year : 2006)?.uppercased() // returns "TAYLOR SWIFT"
/* NOTE that there is a question mark in there , which is the optional chaining :
 * everything after the question mark will only be run if everything before the question mark has a value .
 */
print("The album is \(albumOC)") // Prints : "The album is Optional("TAYLOR SWIFT")"


/* 2. NIL COALESCING OPERATOR
 * What it does is let you say
 * "use value A if you can , but if value A is nil then use value B ." That's it .
 * It is particularly helpful with optionals ,
 * because it effectively stops them from being optional
 * because you provide a non-optional value B . So ,
 * if A is optional and has a value , it gets used (we have a value.)
 * If A is present and has no value , B gets used (so we still have a value) . Either way ,
 * we definitely have a value .
 */

let albumNCO = albumReleased(year: 2006) ?? "unknown"
print("The album is \(albumNCO) .") // Prints : The album is Taylor Swift


func compare(firstWord: String ,
             secondWord: String)
    -> Bool {
    
    return firstWord.uppercased() == secondWord.uppercased()
}

compare(firstWord: "hello" ,
        secondWord: "Hello")



/* ENUMERATIONS
 */
// Enums with additional values :

enum WeatherType {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}

func getHaterStatus(weather: WeatherType)
    -> String? {
    
    switch weather {
    case .sun                              : return nil
    case .wind(let speed) where speed < 10 : return "meh"
        //  This uses the let keyword to access the value inside a case , then the where keyword for pattern matching .
    case .cloud , .wind                    : return "dislike"
    case .rain , .snow                     : return "hate"
    }
}

let wind = getHaterStatus(weather : WeatherType.wind(speed : 5))
let sun = getHaterStatus(weather: WeatherType.sun)
//print(sun)
sun?.count

if let _sun = sun {
    _sun.count
} else {
    "There is no sun ."
}

//if let _rain = getHaterStatus(weather: .rain) {
//    return _rain
//} else {
//    return "It is not raining ."
//}


/* NOTE
 * Associated values attach extra data to an enum case ;
 * raw values are underlying data types for each case .
 */
