import Foundation

/* DAY 4
 * Loops
 */


/* FOR LOOPS
 * A For Loop loops over arrays and ranges ,
 * and each time the loop goes around
 * it will pull out one item and assign to a constant .
 */

print("Players are gonna ")

for _ in 1...5 {
    print("play .")
}

/* If you don’t use the constant that for loops give you ,
 * you should use an underscore instead
 * so that Swift doesn’t create needless values .
 */

var speeds = (65 , 58 , 72)
// You cannot loop over tuples without conforming to the sequence protocol :
//for speed in speeds {
//    print("You were driving at \(speed)km/h .")
//}

var colors = Set(["blue" , "yellow" , "green"])

for color in colors {
    print(color)
}


/* WHILE LOOPS
 * Give it a condition to check ,
 * and its loop code will go around and around until the condition fails .
 */

var number = 5

while number >= 0 {
    print("Counting down \(number)")
    number -= 1
}

print("Ready or not , here I come !")


/* REPEAT LOOPS
 * A Repeat Loop is identical to a while loop
 * except the condition to check comes at the end .
 */
/* Because the condition comes at the end of the repeat loop
 * the code inside the loop will always be executed at least once ,
 * whereas while loops check their condition before their first run .
 */

let numbers: [Int] = [1 , 2 , 3 , 4 , 5]
var shuffledNumbers: [Int]

repeat {
    shuffledNumbers = numbers.shuffled()
} while shuffledNumbers == numbers


/* EXITING LOOPS
 * You can exit a loop at any time using the break keyword .
 * Sometimes you do want to end your loop prematurely . For example ,
 * if you had an array of scores
 * and you want to figure out how many of them the player achieved without getting a 0 :
 */

let scores: [Int] = [6 , 4 , 7 , 3 , 0 , 9]
var scoreCount: Int = 0

for score in scores {
    if score == 0 {
        break
        // Without break we’d need to continue looping through scores even after we found the first 0 , which is wasteful .
        // NOTE : Using break by itself exits the current loop only .
    }
    
    scoreCount += 1
}

print("\(scoreCount) scores before 0 .")



/* EXITING MULTIPLE LOOPS
 * If you put a loop inside a loop it’s called a nested loop ,
 * and it’s not uncommon to want to break out
 * of both the inner loop and the outer loop at the same time .
 */
/* Swift’s labeled statements allow us to name certain parts of our code ,
 * and it is most commonly used for breaking out of nested loops .
 */


outerloop : for multiplicator1 in 1...10 {
    for multiplicator2 in 1...10 {
        
        let multiplication = multiplicator1 * multiplicator2
        print("\(multiplicator1) * \(multiplicator2) is \(multiplication)")
        
        if multiplication == 50 {
            print("Bullseye !")
            break outerloop
            // With a regular break , only the inner loop would be exited – the outer loop would continue where it left off .
        }
    }
}



/* SKIPPING ITEMS
 * If you just want to skip the current item and continue on to the next one , you should use continue instead .
 */
/* When we use
 * continue
 * we are saying
 * "I am done with the current run of this loop"
 * – Swift will skip the rest of the loop body ,
 * and go to the next item in the loop .
 * But when we say
 * break
 * we are saying
 * "I am done with this loop altogether , so get out completely ."
 * That means Swift will skip the remainder of the body loop ,
 * but also skip any other loop items that were still to come .
 */
/* NOTE
 * Just like break , you can use
 * continue
 * with labeled statements if you want .
 */

for item in 1...10 {
    if item % 2 == 1 {
        print("Skip \(item) .")
        continue
    }
    
    print("\(item) is an even number .")
}


var hoursStudied = 0
var goal = 10

repeat {
    hoursStudied += 1
    if hoursStudied > 4 {
        goal -= 1
        continue
    }
    print("I've studied for \(hoursStudied) hours")
} while hoursStudied < goal

2 < 2


var passengerNumber = 0

while passengerNumber < 20 {
    passengerNumber += 1
    
    if passengerNumber == 13 {
        print("Let's skip the unlucky one.")
        continue
    }
    
    print("Now boarding passenger \(passengerNumber)")
}


/* INFINITE LOOPS
 * It is common to use while loops to make infinite loops :
 * loops that either have no end or only end when you’re ready .
 * All apps on your iPhone use infinite loops ,
 * because they start running , then continually watch for events until you choose to quit them .
 */
/* To make an infinite loop ,
 * just use true as your condition .
 * true is always true ,
 * so the loop will repeat forever .
 * Warning : Please make sure you have a check that exits your loop, otherwise it will never end .
 */

var counter = 0

while true {
    print(" ")
    counter += 1
    
    if counter == 273 {
        break
    }
}


var isAlive: Bool = false

while isAlive == true {
    print("I am alive")
}

print("I have sniffed it !")

/* All the apps you use on your iPhone have infinite loops .
 * Think about it :
 * when your app launches it needs to repeat a series of instructions until it’s told to stop :
 * 1. Check for any user input
 * 2. Run any code you need
 * 3. Redraw the screen
 * 4. Repeat
 */


//var username = "twostraws"
//repeat {
//    print("Your username is \(username)")
//} while username // ERROR : Cannot convert String to expected condition type Bool .
