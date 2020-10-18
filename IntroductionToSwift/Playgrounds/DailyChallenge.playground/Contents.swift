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
