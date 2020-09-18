import UIKit

/* DAY 7
 * CLOSURES Part 2
 */

/* CLOSURES WITH PARAMETERS
 * Once you become more comfortable with closures ,
 * you’ll start to realize the power here is
 * that our closure is effectively a sealed box .
 * Yes , we know that it will print a message that we are travelling to a destination ,
 * but all travel() knows
 * is that it takes a String and returns nothing .
 */

func travel(action: (String) -> Void) {
    print("Let's go .")
    action("London")
    print("Let's explore .")
}

travel { (destination: String) in
    print("Let's travel to \(destination) .")
}



/* USING CLOSURES AS PARAMETERS WHEN THEY RETURN VALUES
 */


/* SHORTHAND PARAMETER NAMES
 *
 */

func tr4vel(action: (String) -> String) {
    print("Let's go .")
    action("London")
    print("Let's explore .")
}


/* Swift knows the parameter to that closure must be a string ,
 * so we can remove it :
 */
//tr4vel { (place: String) -> String in
//    return "I am going to \(place) ."
//}

/* Swift also knows the closure must return a string ,
 * so we can remove that :
 */
//tr4vel { place in
//    return "I am going to \(place) ."
//}

/* If there is only one line of code ,
 * you can skip writing return :
 */
//tr4vel { place in
//    "I am going to \(place) ."
//}

/* Swift has a shorthand syntax that lets you go even shorter .
 * Rather than writing
 * place in
 * we can let Swift provide automatic names for the closure’s parameters .
 * These are named with a dollar sign ,
 */
tr4vel { "I am going to \($0) ." }
/* NOTE
 * Swift automatically provides the $ variables ;
 * we don't define them ourselves .
 */
/* NOTE
 * When using shorthand parameters
 * you don't list the parameters you accept .
 */



/* CLOSURES WITH MULTIPLE PARAMETERS
 */

func wandering(action: (String , Int) -> String) {
    let place: String = "Earth"
    let time: Int = 9
    print("I wonder .")
    print(action(place , time))
    print("I reflect .")
}

//wandering { (place: String , time: Int) -> String in
//    return "I am going to \(place) at \(time) ."
//}

wandering { "hello \($0) , see you at \($1) !" }



/* RETURNING CLOSURES FROM FUNCTIONS
 *
 */

func travelling()
    -> (String) -> Void {
        
        return { (destination: String) in
            print("I am going to \(destination) .")
        }
}


let result = travelling()
result("Oz")

/* A function that returned one random number between 1 and 10 :
 */
func getRandomNumber()
    -> Int {
        
        return Int.random(in : 1...10)
}

print(getRandomNumber())



/* A function that returns a closure that , when called , will generate a random number from 1 through 10 :
 */
func makeRandomNumberGenerator()
    -> () -> Int {
    
        let function = {
            Int.random(in: 1...10)
        }
        
        return function
}

let generator = makeRandomNumberGenerator()
let random1 = generator()
print(random1)

/* NOTE :
 * The flexibility here is that all our code can call makeRandomGenerator() to be sent back some sort of code that can generate
 * a random number . It doesn’t have to care what it does ; we only care that it generates a new number every time it is called .
 */



/* CAPTURING VALUES
 * Put simply , value capturing takes place
 * so that your closure always has access to the data it needs to work ,
 * which means Swift can run the closure safely .
 */
/* Closuring capturing matters :
 * having an external value makes sure we can track some state outside a closure while using it inside .
 */

func makeRandomNumberGenerator2()
    -> () -> Int {
    
    var previousNumber = 0
    // What you’re seeing here is the power of closure capturing: that previousNumber variable isn’t inside the closure, but because the closure requires it to exist in order to run it will be captured. That is, Swift will make sure it stays in existence even after makeRandomNumberGenerator() has finished running and it would normally have been destroyed.
    
    return {
//        var previousNumber = 0
        var newNumber: Int
        
        repeat {
            newNumber = Int.random(in: 1...3)
        } while newNumber == previousNumber
        
        previousNumber = newNumber
        return newNumber
    }
}

let generator2 = makeRandomNumberGenerator2()

for _ in 1...10 {
    print(generator2())
}
