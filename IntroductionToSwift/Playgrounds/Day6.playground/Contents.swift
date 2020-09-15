import UIKit

/* DAY 6
 * CLOSURES Part 1
 */

/* CREATING BASIC CLOSURES
 * One of the most common reasons for closures in Swift is to store functionality
 * – to be able to say "here is some work I want you to do at some point , but not necessarily now ."
 * Some examples :
 * 1. Running some code after a delay .
 * 2. Running some code after an animation has finished .
 * 3. Running some code when a download has finished .
 * 4. Running some code when a user has selected an option from your menu .
 */

let cooking = {
    print("Let's prepare Dinner .")
}

cooking()



/* ACCEPTING PARAMETERS
 * NOTE :
 * One of the differences between functions and closures is
 * that you don’t use parameter labels when running closures .
 */
/* The
 * in
 * keyword is there to mark the end of the parameter list
 * and the start of the closure’s body itself .
 */
/* Closures take their parameters inside the brace to avoid confusing Swift :
 * if we had written
 * let payment = (user: String, amount: Int)
 * then it would look like we were trying to create a tuple , not a closure , which would be strange .
 */

let journey = { (destination: String) in
    print("I am going to \(destination) .")
}

journey("London")



/* RETURNING VALUES
 */

let walking = { (destination: String) -> String in
    return "I am walking to \(destination) ."
}

let mywalk = walking("Naples")
print(mywalk)

/* NOTE
 * If you want to return a value without accepting any parameters ,
 * you can’t just write
 * -> Bool in
 * – Swift won’t understand what you mean . Instead ,
 * you should use empty parentheses for your parameter list , like this :
 */

let recipe = { () -> String in
    return "Read your recipe first before you start cooking ."
}

print(recipe())



/* CLOSURES AS PARAMETERS
 * We can write a travel() function that accepts different kinds of traveling actions ,
 * and prints a message before and after :
 */

let running = {
    print("I am going for a run .")
}

func travel(action: () -> Void) {
    print("I am getting ready to go .")
    action()
    print("I arrived .")
}

travel(action : running)

/* When to use a closure ?
 * When we request data from the internet
 * we do so with closures :
 * "please fetch this data, and when you’re done run this closure ."
 * Again , it means we don’t force our user interface to freeze while some slow work is happening .
 */



/* TRAILING CLOSURE SYNTAX
 */

func travelling(action: () -> Void) {
    print("Let's go !")
    action()
    print("We have arrived !")
}

/* Because its last parameter is a closure ,
 * we can call travel() using trailing closure syntax like this :
 */

//travel() {
//    print("Let's go by bike !")
//}

/* NOTE
 * Because there aren’t any other parameters ,
 * we can eliminate the parentheses entirely :
 */

travelling {
    print("Let's go by bike !")
}


