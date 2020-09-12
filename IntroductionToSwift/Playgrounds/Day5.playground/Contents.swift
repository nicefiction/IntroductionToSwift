import Foundation

/* DAY 5
 * Functions
 */


/* WRITING FUNCTIONS
 */
/* Swift lets us build new functions out of existing functions ,
 * which is a technique called function composition .
 */


/* ACCEPTING PARAMETERS
 */


/* RETURNING VALUES
 * TIP : If you need to return multiple values , this is a perfect example of when to use tuples .
 */
/* When our code can be boiled down to a single value ,
 * such as true , false , “Hello” , or 19 ,
 * we call that an expression .
 * Expressions are things that can be assigned to a variable ,
 * or printed using print() .
 * On the other hand ,
 * when we’re performing actions
 * such as creating variables , starting a loop , or checking a condition ,
 * then we call that a statement .
 * All this matters
 * because Swift lets us skip using the return keyword when we have only one expression in our function .
 */


func allTestsPassed(tests: [Bool]) -> Bool {
    var counter: Int = 0
    for test in tests {
        counter += 1
        print("Counter : \(counter)")
        if test == false {
            return false
        }
    }
    return true
}

allTestsPassed(tests: [true , true , true , false , true , true , true , false , false ])


/* There are two ways we can send back multiple pieces of data :
 * 1. Using a tuple , such as (name: String , age: Int)
 * 2. Using some sort of collection , such as an array or a dictionary.
 */

func getHuman()
    -> (first: String , last: String) {
        
        return (first : "Taylor" , last : "Swift")
}

let human = getHuman()
print(human.first)


/* PARAMETER LABELS
 */
/* OMITTING PARAMETER LABELS
*/
/* VARIADIC FUNCTIONS
 * Variadic functions accept zero or more of a specific parameter ,
 * and Swift converts the input to an array .
 * Some functions are variadic , which is a fancy way of saying
 * they accept any number of parameters of the same type .
 * Variadic parameters are converted into arrays inside your function .
*/

print("Somewhere" , "Over" , "The" , "Rainbow")
// open("photo.jpg" , "recipes.txt" , "myCode.swift")

/* You can make any parameter variadic by writing ... after its type .
 */

func square(numbers: Int...) {
    for number in numbers {
        print("number squared is \(number * number)")
    }
}

/* By making that parameter variadic ,
 * we can open up a whole range of additional functionality
 * without having to change the way the function is called :
 */
square(numbers: 1 , 2 , 4 , 8)


/* WRITING THROWING FUNCTIONS
 * When you are writing your code , chances are you’ll think to yourself
 * "should this function throw any errors it encounters , or should it maybe handle them itself ?"
 * This is really common , and to be honest there is no single answer
 * 1. – you can handle the errors inside the function (thus making it not a throwing function) ,
 * 2. you can send them all back to whatever called the function (called “error propagation”
 * or sometimes “bubbling up errors”) ,
 * and 3. you can even handle some errors in the function and send some back .
 * All of those are valid solutions , and you will use all of them at some point .
 * When you’re just getting started , I would recommend you avoid throwing functions most of the time .
 * They can feel a bit clumsy at first because you need to make sure all the errors are handled
 * wherever you use the function , so it feels almost a bit "infectious"
 * – suddenly you have errors needing to be handled in several places in your code ,
 * and if those errors bubble up further then the "infection" just spreads .
 */
/* Functions can throw errors ,
 * but you must call them using
 * try
 * and handle errors using
 * catch
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
} // func checkPassword() -> Bool {}



enum BuildingError: Error {
    case tooHigh
    case tooLow
}

func constructBuilding(height: Int) throws {
    if height < 10 {
        throw BuildingError.tooLow
    } else if height > 500 {
        throw BuildingError.tooHigh
    }
    
    print("Perfect - let's get building!")
}


/* RUNNING THROWING FUNCTIONS
 * Swift doesn’t like errors to happen when your program runs ,
 * which means it won’t let you run an error-throwing function by accident .
 * Instead , you need to call these functions using three new keywords :
 * 1. do
 * starts a section of code that might cause problems ,
 * 2. try
 * is used before every function that might throw an error ,
 * 3. and catch
 * lets you handle errors gracefully.
 */

do {
    try checkPassword("password1")
    print("That password is good .")
} catch {
    print("You can't use that password .")
}


/* INOUT PARAMETERS
 * All parameters passed into a Swift function are constants ,
 * so you can’t change them . If you want ,
 * you can pass in one or more parameters as inout ,
 * which means they can be changed inside your function ,
 * and those changes reflect in the original value outside the function .
 * For example , if you want to double a number in place
 * – i.e., change the value directly rather than returning a new one
 * – you might write a function like this :
 */
/* inout parameters must be variables .
 */
/* Changing Inout parameters inside a function changes them outside too .
 */
/* Inout parameters must be passed in using &
 */
/* You can use inout to change variables inside a function ,
 * but it is usually better to return a new value .
 */

func doubleInPlace(number: inout Int) {
    number *= 2
}

/* To use that ,
 * you first need to make a variable integer
 * – you can’t use constant integers with inout , because they might be changed :
 */
var myNumber: Int = 0

/* You also need to pass the parameter to doubleInPlace
 * using an ampersand , & , before its name ,
 * which is an explicit recognition that you are aware it is being used as inout :
 */
doubleInPlace(number: &myNumber)
