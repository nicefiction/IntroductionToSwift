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
