import Foundation

/* DAY 3
 * Operators and Conditions
 */


/* ARITHMETIC OPERATORS
 */

let secondScore: Int = 4

/* Swift has a special operator for calculating remainders after division : % .
 * It calculates how many times one number can fit inside another ,
 * then sends back the value that is left over .
 */
let remainder = 13 % secondScore

let weeks = 465 / 7
let days = 465 % 7
print("There are \(weeks) weeks and \(days) days until the event.")


// let valueDouble: Double = 90_000_000_000_000_001
/* Integers lose the ability to store fractional values ,
 * but they gain the ability to store precise values .
 * This means the following code won’t produce a warning ,
 * because the number can be stored exactly :
 */
let valueInt: Int = 90_000_000_000_000_001


/* TIP :
 * If your goal is to ask “does this number divide equally into some other number?”
 * then Swift has an easier approach :
 */

let isMultiple = weeks.isMultiple(of: 7)


/* OPERATOR OVERLOADING
 * Swift supports operator overloading ,
 * which is a fancy way of saying that
 * what an operator does
 * depends on the values you use it with .
 */

let number = 1
let sum = number + number

let hello = "hello 👋 "
let world = "world 🌍"
let greeting = hello + world

let primaryColors = ["yellow" , "blue" , "red"]
let secondaryColors = ["orange" , "green" , "purple"]
let colors = primaryColors + secondaryColors

colors + secondaryColors


/* COMPOUND OPERATOR
 * Swift has shorthand operators that combine one operator with an assignment ,
 * so you can change a variable in place .
 */

var helloWorld = "hello"
helloWorld += " world"
print(helloWorld)


/* COMPARISON OPERATOR
 * NOTE : Comparison Operators also work with strings ,
 * because strings have a natural alphabetical order .
 */

"Taylor" <= "Dorothy"

/* NOTE :
 * Swift has a special type for storing dates
 * called Date ,
 * and you can compare dates using the same operators :
 * someDate < someOtherDate, for example.
 */
/* NOTE :
 * From Swift 5.3 and later ,
 * we can even ask Swift to make our enums comparable , like this :
 */
//
//enum Sizes: Comparable {
//    case small
//    case medium
//    case large
//}
//
//let first = Sizes.small
//let second = Sizes.medium
//print(first < second)


/* CONDITIONS
 */
/* COMBINING CONDITIONS
 * TIP :
 * Any time you mix && and || in a single condition
 * you should almost certainly use parentheses to make the result clear .
*/
/* TERNARY OPERATOR
 */
/* SWITCH STATEMENTS
 * Write your condition once ,
 * then list all possible outcomes and what should happen for each of them
 * Swift will only run the code inside each case .
 * If you want execution to continue on to the next case ,
 * use the fallthrough keyword like this :
 */
/* If you have multiple conditions using the same value ,
 * it is often clearer to use switch instead .
 */

let weather: String = "sunny"

switch weather {
case "rain" :
    print("Bring an umbrella")
case "snow" :
    print("Wrap up warm")
case "sunny" :
    print("Wear sunscreen")
    fallthrough
    // Code from the following case will be run if you use fallthrough .
    // NOTE : You can use fallthrough as many times as you want .
default :
    print("Enjoy your day!")
}


var age = 18

switch age {
case 0...8 :
    fallthrough
case 9..<18 :
    print("You're still a minor")
default :
    print("You're an adult")
}

/* NOTE
 * When you use switch to check a value for multiple possible results ,
 * that value will only be read once ,
 * whereas if you use if it will be read multiple times .
 * This becomes more important when you start using function calls ,
 * because some of these can be slow .
 */


/* Range Operators :
 * "1 to 5" means 1 , 2 , 3 , and 4 ,
 * but "1 through 5" means 1 , 2 , 3 , 4 , and 5 .
 */
/* Ranges are great for counting through specific values ,
 * but they are also helpful for reading groups of items from arrays :
 */

let rainbowColors: [String] = ["red" , "orange" , "yellow" , "green" , "blue" , "violet"]

rainbowColors[0]
rainbowColors[2...5]
rainbowColors[3...]
