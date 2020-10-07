import Foundation

/* FLOAT AND DOUBLE
 */

var latitude: Double
latitude = 36.166667

var longitude: Float
longitude = -86.783333


longitude = -86.783333
longitude = -186.783333
longitude = -1286.783333
longitude = -12386.783333
longitude = -123486.783333
longitude = -1234586.783333
/* NOTE
 * As you add more numbers before the point ,
 * Swift is removing numbers after .
 */


latitude = 136.166667
latitude = 1236.166667
latitude = 12336.166667
latitude = 123436.166667
latitude = 1234536.166667
/* NOTE
 * Double has twice the accuracy of Float ,
 * so it doesn't need to cut your number to fit .
 */
/* Double does have its limits though :
 */

latitude = 12345678936.123456789166667


/* OPERATORS
 */

var b = 10
b += 10
b *= 10
b -= 10
/* +=
 * is an aoperator that means
 * "add then assign to"
 *  In our case it means
 * "take the current value of b , add 10 to it , then put the result back into b ."
 */

/* MODULO OPERATOR
 * It means
 * “divide the left hand number evenly by the right , and return the remainder .”
 * So , 9 % 3 returns 0
 * because 3 divides evenly into 9 ,
 * whereas 10 % 3 returns 1 ,
 * because 10 divides by 3 three times , with remainder 1 .
 */

/* the ! Operator
 * This makes your statement mean the opposite of what it did .
 */

var stayOutTooLate = true
stayOutTooLate
!stayOutTooLate
 
/* You can also use ! with = to make != or "not equal" .
 */

var name = "Dorothy"
name == "Dorothy"
name != "Dorothy"


/* OPERATOR OVERLOADING
 * Swift supports operator overloading ,
 * which is a fancy way of saying that what an operator does
 * depends on the values you use it with .
 */

let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"

var result = ["Red", "Green"] + ["Blue"]

/* GOTCHA
 * You can't perform addition using Booleans .
 */
// let result = false + false // ERROR


