import Foundation

/* DAY 15
 * SWIFT REVIEW DAY 3
 */

/* PROPERTIES
 */
/* PROPERTY OBSERVERS
 */
/* NOTE
 * You cannot attach a property observer to a constant ,
 * because it will never change .
 */

struct Human {
    var clothes: String {
        willSet {
            updateUI(with : "I am changing clothes from \(clothes) to \(newValue) .")
        }
        
        didSet {
            updateUI(with : "I just changed from \(oldValue) to \(clothes) .")
        }
    }
    
    
    func updateUI(with message: String) {
        print(message)
    }
}


var dorothy: Human = Human(clothes : "jumper")
dorothy.clothes = "dress"



/* COMPUTED PROPERTIES
 */

struct Dog {
    var age: Int
    
    var ageInHumanYears: Int {
        get {
            return age * 7
        }
    }
    /* NOTE
     * If you intend to use them only for reading data
     * you can just remove the get part entirely , like this :
     */
    var humanAge: Int {
        return age * 7
    }
}


let watson: Dog = Dog(age : 6)
print(watson.ageInHumanYears)


/* STATIC PROPERTIES AND METHODS
 */

struct TaylorFan {
    static var favoriteSong: String = "Look what you made me do ."
    
    var name: String
    var age: Int
}

let paul: TaylorFan =  TaylorFan(name : "Paul" ,
                                 age : 38)

paul.age
TaylorFan.favoriteSong
// So , a Taylor Swift fan has a name and age that belongs to them , but they all have the same favorite song .



struct Pokemon {
    static var numberCaught = 0
    var name: String
    
    static func catchPokemon() {
        print("Caught!")
        Pokemon.numberCaught += 1
    }
}



/* ACCESS CONTROL
 * public :
 * this means everyone can read and write the property.
 *
 * internal :
 * this means only your Swift code can read and write the property .
 * If you ship your code as a framework for others to use ,
 * they won’t be able to read the property .
 *
 * fileprivate :
 * this means that only Swift code in the same file as the type can read and write the property .
 *
 * private :
 * this is the most restrictive option , and means the property is available
 * only inside methods that belong to the type , or its extensions .
 */


//struct Doctor {
//    var name: String
//    var location: String
//    private var currentPatient = "No one"
//}
//
//let drJones = Doctor(name : "Esther Jones" ,
//                     location : "Bristol")
// ERROR : This has a private property , so Swift is unable to generate its memberwise initializer for us .



/* POLYMORPHISM AND TYPECASTING
 * An object can work as its class and its parent classes ,
 * all at the same time .
 */

class Album {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getPerformance()
        -> String {
        
        return "The album \(name) has sold lots ."
    }
}


class StudioAlbum: Album {
    var studio: String
    
    init(name: String ,
         studio: String) {
        
        self.studio = studio
        
        super.init(name : name)
    }
    
    override func getPerformance()
        -> String {
        
        return "The studio album \(name) has sold lots ."
    }
}


class LiveAlbum: Album {
    var location: String
    
    init(name: String ,
         location: String) {
        
        self.location = location
        
        super.init(name : name)
    }
    
    override func getPerformance()
        -> String {
        
        return "The live album \(name) has sold lots ."
    }
}


var beethoven = Album(name: "Beethoven")

var taylorSwift = StudioAlbum(name : "Taylor Swift" ,
                              studio : "The Castles Studios")
var fearless = StudioAlbum(name : "Speak Now",
                           studio : "Aimeeland Studio")
var iTunesLive = LiveAlbum(name : "iTunes Live from SoHo" ,
                           location : "New York")

var allAlbums: [Album] = [
    beethoven , taylorSwift , fearless , iTunesLive
]

for album in allAlbums {
    print(album.getPerformance())
}



/* Converting types with typecasting .
 */

for album in allAlbums {
    print(album.getPerformance())
    
    if let _liveAlbum = album as? LiveAlbum {
        print("Live album: \(_liveAlbum.location)")
    }
}


/* What that means is ,
 * “try to convert allAlbums to be an array of LiveAlbum objects ,
 * but if that fails
 * just create an empty array of live albums
 * and use that instead” – i.e., do nothing :
 */
for album in allAlbums as? [LiveAlbum] ?? [LiveAlbum]() {
    print(album.location)
}



/* Converting common types with initializers :
 */

//let number = 5
//let text = number as! String
// ERROR : You can’t force an integer into a string , because they are two completely different types .

let number = 6
let text = String(number) // This only works for some of Swift’s built-in data types .
print(text)



let distances = [
    23 , 28 , 22
]

if
    let _distances = distances as? [String] ?? [String]() {
    
    for distance in _distances {
        print("The distance was \(distance).")
    }
    
    print("Number of items in the String Array : \(_distances.count)")
}


class Glasses {
    var isShortSighted = true
}

class Sunglasses: Glasses { }

let shades = Sunglasses()

if
    let glasses = shades as? Glasses {
    
    if glasses.isShortSighted {
        print("These sunglasses are for shortsighted people.")
    } else {
        print("These sunglasses are for longsighted people.")
    }
}



/* CLOSURES
 * A closure can be thought of as a variable that holds code .
 * So , where an integer holds e.g. 11 ,
 * a closure holds lines of Swift code .
 * Closures also capture the environment where they are created ,
 * which means they take a copy of the values that are used inside them .
 */

/* CLOSURES AS PARAMETERS
 */

let resignation = {
    print("Dear , I'm outta here!")
}

func printDocument(contents: () -> Void) {
    print("Connecting to printer...")
    print("Sending document...")
    contents()
}

printDocument {
    resignation()
}

print("• • • • •")

let resignation2 = { (name: String) in
    print("Dear \(name), I'm outta here!")
}

func printDocument(contents: (String) -> Void) {
    print("Connecting to printer...")
    print("Sending document...")
    let name = "Dorothy"
    contents(name)
}

printDocument {
    resignation2("Ozma")
}


/* TRAILING CLOSURE SYNTAX
 */

func goCamping(then action: () -> Void) {
    print("We're going camping!")
    action()
}

goCamping {
    print("Sing songs")
    print("Put up tent")
    print("Attempt to sleep")
}



/* USING CLOSURES AS PARAMETERS WHEN THEY ACCEPT PARAMETERS
 */

func fetchData(then parse: (String) -> Void) {
    let data = "Success!"
    parse(data)
}

fetchData { (data2: String) in
    print("Data received: \(data2)")
}


func fix(item: String ,
         payBill: (Int) -> Void) {
    
    print("I've fixed your \(item)")
    payBill(450)
}

fix(item : "roof") { (bill: Int) in // OLIVIER : The argument label can be different from the parameter name .
    print("You want $\(bill) for that? Outrageous!")
}



/* USING CLOSURES AS PARAMETERS WHEN THEY RETURN VALUES
 */

func playSong(_ name: String ,
              notes: () -> String) {
    
    print("I'm going to play \(name).")
    let playedNotes = notes()
    print(playedNotes)
}

playSong("Mary Had a Little Lamb") {
    return "EDCDEEEDDDEGG"
}


func manipulate(numbers: [Int] ,
                using algorithm: (Int) -> Int) {
    
    for number in numbers {
        let result = algorithm(number)
        print("Manipulating \(number) produced \(result)")
    }
}

manipulate(numbers : [1, 2, 3]) { (number: Int) in
    return number * number
}


func scoreToGrade(score: Int ,
                  gradeMapping: (Int) -> String) {
    
    print("Your score was \(score)%.")
    let result = gradeMapping(score)
    print("That's a \(result).")
}

scoreToGrade(score : 80) { (grade: Int) in
    if grade < 85 {
        return "Fail"
    }
    return "Success"
}


func printGreeting(for usernameLoader: (String) -> String) {
    
    let username = usernameLoader("Glinda")
    print("Hello, \(username)!")
}

//printGreeting { (name: String) in
printGreeting { name in
    return "twostraws"
}


/* CLOSURES WITH MULTIPLE PARAMETERS
 */

func takeTest(topic: String ,
              test: (Int)) {
    
    let minutes = 120
    print("Today's test is on \(topic).")
    print("You have \(minutes) minutes.")
    print(test)
}

takeTest(topic: "Test" , test: (8))



/* RETURNING CLOSURES FRO FUNCTIONS
 */

func travel()
    -> (String) -> Void {
    
    return { (destination: String) in
        print("I am going to \(destination) .")
    }
}

let result = travel()
result("London")


func createValidator()
    -> (String) -> Bool {
    
    return {
        if $0 == "twostraws" {
            return true
        } else {
            return false
        }
    }
}

let validator = createValidator()
print(validator("twostraws"))


func makeRecorder(media: String)
    -> () -> String {
    
    switch media {
    case "podcast" :
        return {
            return "I'm recording a podcast"
        }
    default :
        return {
            return "I'm recording a video"
        }
    }
}

let recorder = makeRecorder(media : "podcast")
print(recorder())


func createTravelMethod(distance: Int)
    -> (String) -> Void {
    
    if distance < 5 {
        return {
            print("I'm walking to \($0).")
        }
    } else if distance < 20 {
        return {
            print("I'm cycling to \($0).")
        }
    } else {
        return {
            print("I'm driving to \($0).")
        }
    }
}

let travelMethod = createTravelMethod(distance : 15)
travelMethod("London")


//func catchPokemon(level: Int)
//    -> () {
//
//    if level < 10 {
//        return
//    } else if level < 20 {
//        return
//    } else {
//        return
//    }
//}
//let catcher = catchPokemon(level: 11)


func createDoubler()
    -> (Int) -> Int {
    
    return {
        return $0 * 2
    }
}

let doubler = createDoubler()
print(doubler(2))


/* CAPTURING VALUES
 */

func travel2()
-> (String) -> Void {
    
    var counter = 0
    
    return { (destination: String) in
        counter += 1
        print("Counter : \(counter) • I am going to \(destination) .")
    }
}

let result2 = travel2()
result2("London")
result2("London")
result2("London")
result2("London")


func makeAdder()
    -> (Int) -> Void {
    
    var sum = 0
    return {
        sum += $0
        print("Sum is now \(sum)")
    }
}

let adder = makeAdder()
adder(5)
adder(3)


func findTallest()
    -> (String, Double) -> (String) {
    
    var tallestName = ""
    var tallestHeight: Double = 0
    
    return {
        if $1 > tallestHeight {
            tallestName = $0
            tallestHeight = $1
        }
        return tallestName
    }
}

let tallest = findTallest()
var tallestName = tallest("Hannah" , 1.72)
tallestName = tallest("Christina" , 1.68)


func visitPlaces()
    -> (String) -> Void {
    
    var places = [String: Int]()
    
    return {
        places[$0, default: 0] += 1
        let timesVisited = places[$0, default: 0]
        print("Number of times I've visited \($0): \(timesVisited).")
    }
}

let visit = visitPlaces()
visit("London")
visit("New York")
visit("London")



/* PROTOCOLS
 */
/* NOTE
 * Both properties have { get set } after them .
 * This means that conforming types must make them both
 * gettable (readable)
 * and settable (writeable) ,
 * which in turn means
 * if a type says it is compatible with the Employee protocol
 * it must make those two properties variables rather than constants .
 */
/* NOTE
 * It is not possible to create set only properties in Swift .
 */

protocol Employee {
    var name: String { get set }
    var jobTitle: String { get set }
    
    func doWork()
}

struct Executive: Employee {
    var name: String = "Steve Jobs"
    var jobTitle: String = "CEO"
    
    func doWork() {
        print("I am strategizing .")
    }
}

struct Manager: Employee {
    var name: String = "Maurice Moss"
    var jobTitle: String = "Head of IT"
    
    func doWork() {
        print("I am turning it on and off again .")
    }
}

let staff: [Employee] = [
    Executive() , Manager()
]

for person in staff {
    person.doWork()
}


protocol HasEngine {
    func startEngine()
}

protocol HasTrunk {
    func openTrunk()
}

struct Car: HasEngine, HasTrunk {
    func startEngine() {
        print("Start your engine .")
    }
    
    func openTrunk() {
        print("Open the trunk .")
    }
}


/* EXTENSIONS
 * In some ways , extensions are similar to subclasses ,
 * so why use extensions at all ?
 * The main reason is extensibility :
 * extensions work across all data types ,
 * and they don't conflict when you have more than one .
 */

var myInt: Int = 10

extension Int {
    
    mutating func plusOne() {
//        -> Int {
        
//        return self + 1
        self += 1
    }
}

myInt.plusOne()
// 5.plusOne()
/* NOTE :
 * Swift doesn't let you modify self inside an extension by default .
 * The reason is that we could call plusOne() using 5.plusOne() ,
 * and clearly you can't modify the number 5 to mean something else .
 */
print(myInt)

// let otherInt: Int = 6
// otherInt.plusOne()
// ERROR : Swift won't let you modify constants .


/* PROTOCOL EXTENSIONS
 * Protocol extensions let us define implementations of things inside the protocol ,
 * adding the functionality to all types that conform to the protocol in a single place .
 */

protocol SmartPhone {
    func makeCall(to name: String)
}

extension SmartPhone {
    func makeCall(to name: String) {
        print("Dialling \(name)...")
    }
}



/* PROTOCOLS AND EXTENSIONS SUMMARY
 */

protocol HasAge {
    var age: Int { get set }
    mutating func celebrateBirthday()
//    func celebrateBirthday()
}

class Halloween: HasAge {
    var age: Int = 42
    
    func celebrateBirthday() {
        age += 1
        print("I am \(age) years old .")
    }
}

let olivier = Halloween()
olivier.celebrateBirthday()


struct Birthday: HasAge {
    var age: Int = 44
    
//    mutating func celebrateBirthday() {
    mutating func celebrateBirthday() {
        age += 1
        print("My age : \(age)")
    }
}

var birthday = Birthday()
birthday.celebrateBirthday()



/* NOTE
 * You have already seen how the self keyword lets us refer to our current value ,
 * so self * self means “multiply my current number by itself.”
 * Well , there is also Self with a capital S , which has a subtly different meaning :
 * it means “my current data type.”
 * So , self means “my current value”
 * and Self means “my current data type.”
 */
extension BinaryInteger {
    func clamp(low : Self ,
               high : Self)
        -> Self {
        
        if (self > high) {
            return high
        } else if (self < low) {
            return low
        }

        return self
    }
}
