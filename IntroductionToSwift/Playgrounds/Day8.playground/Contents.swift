import Foundation

/* DAY 8
 * STRUCTS , PART 1
 */


/* CREATING STRUCTS
 * NOTE :
 * Properties can have default values just like regular variables .
 */

struct Sport {
    var name: String // These are called stored properties .
    var isOlympicSport: Bool
    
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport ."
        } else {
            return "\(name) is not an Olympic sport ."
        }
    }
}

var tennis = Sport(name : "Tennis" ,
                   isOlympicSport : true)
print(tennis.name)
tennis = Sport(name : "lawn tennis" ,
               isOlympicSport : true)
print(tennis.name)


/* NOTE :
 * A tuple is effectively just a struct without a name , like an anonymous struct .
 * This means you can define it as
 * (name: String, age: Int, city: String)
 * and it will do the same thing as the following struct :
 */

struct Human {
    var name: String
    var age: Int
    var city: String
}

/* However , tuples have a problem :
 * while they are great for one-off use ,
 * particularly when you want to return several pieces of data from a single function ,
 * they can be annoying to use again and again :
 */

func authenticate(_ user: (name: String ,
                           age: Int ,
                           city: String)) { }

func showProfile(for user: (name: String ,
                            age: Int ,
                            city: String)) { }

func signOut(_ user: (name: String ,
                      age: Int ,
                      city: String)) { }

/* Compare this to :
 */

func authenticate(_ user: Human) { }
func showProfile(for user: Human) { }
func signOut(_ user: Human) { }

/* So , use tuples when you want to return two or more arbitrary pieces of values from a function ,
 * but prefer structs when you have some fixed data you want to send or receive multiple times .
 */



/* COMPUTED PROPERTIES
 * A computed property is a property that runs code to figure out its value .
 */
/* If you regularly read the property when its value hasn’t changed ,
 * then using a stored property will be much faster than using a computed property .
 * On the other hand , if your property is read very rarely and perhaps not at all ,
 * then using a computed property saves you from having to calculate its value and store it somewhere .
 * NOTE : Lazy properties help mitigate the performance issues of rarely read stored properties .
 */
/* When it comes to dependencies
 * – whether your property’s value relies on the values of your other properties –
 * then the tables are turned :
 * this is a place where computed properties are useful ,
 * because you can be sure the value they return always takes into account the latest program state .
 * NOTE : Property observers mitigate the dependency problems of stored properties .
 */

let chessBoxing = Sport(name : "Chess Boxing" ,
                        isOlympicSport : false)
print(chessBoxing.olympicStatus)



/* PROPERTY OBSERVERS
 * Swift’s property observers let us attach functionality to be run
 * before or after a property is changed ,
 * using willSet and didSet respectively .
 */
/* Using a property observer means
 * your functionality will be executed whenever the property changes . Sure ,
 * you could use a function to do that ,
 * but would you remember ? Always ? In every place you change the property ?
 */
/* Most of the time you will be using didSet ,
 * because we want to take action after the change has happened
 * so we can update our user interface , save changes , or whatever .
 */
/* The most common time willSet is used
 * is when you need to know the state of your program before a change is made . For example ,
 * SwiftUI uses willSet in some places to handle animations
 * so that it can take a snapshot of the user interface before a change .
 * When it has both the “before” and “after” snapshot ,
 * it can compare the two to see all the parts of the user interface that need to be updated .
 */

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("The \(task) is \(amount) % complete .")
        }
    }
}


var progress = Progress(task : "Test" ,
                        amount : 10)
progress.amount
progress.amount = 11

/* NOTE
 * You can't attach a property observer to a constant , because it will never change .
 */



/* METHODS
 */


/* MUTATING METHODS
 * NOTE :
 * If a struct has a variable property
 * but the instance of the struct was created as a constant ,
 * that property can’t be changed
 * – the struct is constant ,
 * so all its properties are also constant regardless of how they were created .
 */
/* The problem is that when you create the struct
 * Swift has no idea whether you will use it with constants or variables ,
 * so by default it takes the safe approach :
 * Swift won’t let you write methods that change properties
 * unless you specifically request it .
 */

struct Hum4n {
    var name: String
    
    mutating func changeName() {
        name = "Dorothy"
        print(name)
    }
}


var dorothy = Hum4n(name: "Ozma")
dorothy.changeName()

let ozma = Hum4n(name: "Glinda")
//ozma.changeName() // ERROR : Because it changes the property , Swift will only allow that method to be called on Person instances that are variables .

/* NOTE :
 * Marking methods as mutating will stop the method from being called on constant structs ,
 * even if the method itself doesn’t actually change any properties .
 * If you say it changes stuff , Swift believes you !
 */
/* NOTE :
 * A method that is not marked as mutating cannot call a mutating function
 * – you must mark them both as mutating .
 */



/* PROPERTIES AND METHODS OF STRINGS
 * In many other languages , strings aren’t structs
 * – they are just a sequence of letters , and nothing more .
 * Swift takes a different approach : strings are structs ,
 * and in fact come packed with functionality .
 */
/* Almost all of Swift’s core types are implemented as structs ,
 * including strings , integers , arrays , dictionaries , and even Booleans .
 * This isn’t an accident : structs are simple , fast , and efficient in Swift ,
 * which means we can create and destroy them as much as we need
 * without worrying too much about performance .
 */

let string = "Do or do not , there is no try ."
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())



/* PROPERTIES AND METHODS OF ARRAYS
 * Arrays are also structs ,
 * which means they too have their own methods and properties we can use to query
 * and manipulate the array .
 */

var colors: [String] = ["Yellow"]
print(colors.count)
colors.append("Blue")

/* You can locate any item inside an array
 * using its firstIndex() method , like this :
 */

colors.firstIndex(of : "Blue") // returns 1

print(colors.sorted())

colors.remove(at : 0)

colors.insert("Green" ,
              at : 0)
