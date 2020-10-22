import Foundation

let names: [String] = [
    "Terry Jones" , "John Terry" , "Terry Crews" , "Terry Farrell" , "Samuel Terry"
]

// let terryArray = names.firstIndex(of: "Terry ")
var terryArray: [String] = []

for name in names {
    switch name {
    case "Terry Jones" , "Terry Crews" , "Terry Farrell" : terryArray.append(name)
    default : continue
    }
}

print(terryArray)



struct User {
    var name = "Anonymous"
    var age: Int
}

let twostraws = User(name : "Paul" , age : 38)


func joinedTogether(firstWord: String ,
                    secondWord: String)
    -> String {
    
    return ("\(firstWord)\(secondWord)")
}


let words = [
    "The" , "rain" , "in" , "Spain"
]

var capitalizedWords = Array<String>()

for word in words {
    capitalizedWords.append(word.uppercased())
//    capitalizedWords.append(word)
}

print(capitalizedWords)

let dorothy: String = "Dorothy"

print(dorothy.uppercased())
print(dorothy)


func playOpera(by composer: String?)
    -> String? {
    
    guard
        let _composer = composer
        else {
        return "Please specify a composer ."
    }
    
    if _composer == "Mozart" {
        return "Le nozze di Figaro"
    } else {
        return nil
    }
}

let opera = playOpera(by : "Beethoven")

if
    let opera2 = playOpera(by : "Mozart") {
    print(opera2)
}


func uppercase(string: String?)
    -> String? {
    
    guard
        let _string = string
        else { return nil }
    
    return _string.uppercased()
}


let hello = uppercase(string: "Hello")

if
    let world = uppercase(string: "World") {
    print(world)
}



func verify(age: Int?)
    -> Bool {
    
//    guard age >= 18
// ERROR : Value of optional type 'Int?' must be unwrapped to a value of type 'Int' .
//    else {
//        return true
//    }
//
//    return false
    
//    guard age >= 18 {
//        return true
//    } else {
//        return false
//    }
// ERROR : Expected 'else' after 'guard' condition .
    
    guard
        let _age = age
        else { return false }
    
    if _age >= 18 {
        return true
    } else {
        return false
    }
}

if verify(age: 42) {
    print("You are old enough .")
} else {
    print("Come back in a few years .")
}



let numbers = [1 , 3 , 5 , 7 , 9]
var numbersDoubled = Array<Int>()

for number in numbers {
    numbersDoubled.append(number * 2)
}

print(numbersDoubled)

let numbersDoubled2 = numbers.map {
    $0 * 2
}

print(numbersDoubled2)


func swingBat()
    -> () -> Void {
    
    var swingCount = 0
    
    return {
        if swingCount >= 3 {
            print("You are out !")
        } else {
            print("Strike \(swingCount)")
        }
        swingCount += 1
    }
}

let swing = swingBat()
swing()

print("• • • • •")

func username(for id: Int?)
    -> String? {
    
    guard
        let _id = id
        else { return nil }
    
    if _id == 1989 {
        return "Taylor Swift"
    } else {
        return nil
    }
}


if
    let _user = username(for: 1980) {
    print("Hello \(_user)")
}



/* PROPERTIES AND METHODS OF STRINGS
 */

let definitelyTrue = "Fox in box"
definitelyTrue.contains("socks")


var str = ""
for i in 1...5 {
    str += "\(i)"
}
str.count == 5
print(str)


/* PROPERTIES AND METHODS OF ARRAYS
 */

var usedNumbers = [Int]()
for i in 1...10 {
    usedNumbers.append(i)
}
usedNumbers.count > 5



