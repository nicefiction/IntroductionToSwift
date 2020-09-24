import Foundation


/* DAY 10
 * CLASSES
 */

/* CREATING YOUR OWN CLASSES
 * NOTE :
 * Variable properties in constant classes can be modified freely ,
 * but variable properties in constant structs cannot .
 */
/* Classes only need initializers if you don't give their properties default values .
 */



/* CLASS INHERITANCE
 */

class Printer {
    var cost: Int
    init(cost: Int) {
        self.cost = cost
    }
}
class LaserPrinter: Printer {
    var model: String
    init(model: String, cost: Int) {
        self.model = model
        super.init(cost: cost)
    }
}


class Instrument {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Piano: Instrument {
    var isElectric: Bool
    init(isElectric: Bool) { // OLIVIER: No need to write name as a parameter as it gets a default value .
        self.isElectric = isElectric
        super.init(name: "Piano")
    }
}



/* OVERRIDING METHODS
 * Child classes can replace parent methods with their own implementations – a process known as overriding .
 */


/* FINAL CLASSES
 * Sometimes you want to disallow other developers from building their own class based on yours .
 * Swift gives us a final keyword just for this purpose :
 * when you declare a class as being final , no other class can inherit from it .
 * This means they can’t override your methods in order to change your behavior
 * – they need to use your class the way it was written .
 */



/* COPYING OBJECTS
 */



/* DEINITIALZERS
 * Behind the scenes Swift performs something called automatic reference counting , or ARC .
 * ARC tracks how many copies of each class instance exists :
 * every time you take a copy of a class instance
 * Swift adds 1 to its reference count ,
 * and every time a copy is destroyed
 * Swift subtracts 1 from its reference count .
 * When the count reaches 0
 * it means no one refers to the class any more ,
 * and Swift will call its deinitializer and destroy the object .
 */
/* The simple reason for why structs don’t have deinitializers is
 * because they don’t need them: each struct has its own copy of its data ,
 * so nothing special needs to happen when it is destroyed .
 */
/* Deinitializers run when an instance of a class is destroyed .
 */



/* MUTABILITY
 * One of the small but important differences between structs and classes is
 * the way they handle mutability of properties :
 * 1. Variable classes can have variable properties changed .
 * 2. Constant classes can have variable properties changed .
 * 3. Variable structs can have variable properties changed .
 * 4. Constant structs cannot have variable properties changed .
 */
/* That is how structs work in Swift :
 * when we change one of its properties ,
 * we are in fact changing the entire struct .
 */
/* Classes don’t enforce constants as strongly as structs
 * – if a property is declared as a variable ,
 * it can be changed regardless of how the class instance was created .
 */

class Singer {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

let taylor = Singer(name: "Ozma")
taylor.name = "Taylor"


class Singer2 {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let dido = Singer2(name: "Dorothy")
//dido.name = "Dido" // ERROR


struct Kindergarten {
    var numberOfScreamingKids = 30
    mutating func handOutIceCream() {
        numberOfScreamingKids = 0
    }
}

let kindergarten = Kindergarten()
//kindergarten.handOutIceCream() // ERROR : This attempts to call a mutating method on a constant struct instance .


struct Barbecue {
    var charcoalBricks = 20
    mutating func addBricks(_ number: Int) {
        charcoalBricks += number
    }
}
var barbecue = Barbecue()
barbecue.addBricks(4)



class Light {
    
    var onState = false
    
    // OLIVIER : Note how this class does not need an initialzer .
    
    func toggle() {
        if onState {
            onState = false
        } else {
            onState = true
        }
        print("Click")
    }
}

let light = Light()
light.toggle()
