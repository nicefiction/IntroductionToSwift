import Foundation

/* DAY 11
 * PROTOCOLS
 */


/* PROTOCOLS
 * Protocols let us define how structs ,
 * classes ,
 * and enums ought to work :
 * what methods they should have ,
 * and what properties they should have .
 */


/* PROTOCOL INHERITANCE
 * Unlike with classes ,
 * you can inherit from multiple protocols at the same time
 * before you add your own customizations on top .
 */
/* One common reason for using protocol inheritance is
 * to combine functionality for common work .
 */

protocol HasEngine {
    func startEngine()
}

protocol HasTrunk {
    func openTrunk()
}

struct Car: HasEngine, HasTrunk {
    func startEngine() {
        print("Starting the engine .")
    }
    
    func openTrunk() {
        print("Opening the trunk .")
    }
}
// ERROR : Although Car conforms to both protocols , there is no protocol inheritance here – neither protocol builds on the other .


protocol HasMindTricks {
    func waveHandMystically()
}

protocol UsesForce {
    func raiseXWing()
}

protocol JediKnight: HasMindTricks, UsesForce { }


/* EXTENSIONS
 * Extensions allow you to add methods to existing types ,
 * to make them do things they weren’t originally designed to do .
 */
/* NOTE :
 * Swift doesn’t let you add stored properties in extensions ,
 * so you must use computed properties instead .
 */
/* When to use Extensions :
 * 1. To add functionality to classes , structs , and more ,
 *    which is helpful for modifying types we don’t own
 *    – types that were written by Apple or someone else , for example .
 * 2. Extensions are also useful for organizing our own code :
 *    2.1 CONFORMANCE GROUPING means adding a protocol conformance to a type as an extension ,
 *        adding all the required methods inside that extension.
 *    2.2 PURPOSE GROUPING means creating extensions to do specific tasks ,
 *        which makes it easier to work with large types .
 *        For example , you might have an extension specifically to handle loading and saving of that type .
 */


extension String {
    
    mutating func append(_ other: String) { // OLIVIER : Because String is a struct .
        
        self += other
    }
}


extension Int {
    
    func cubed()
    -> Int {
        
        return self * self * self
    }
}


extension String {
    
    var isLong: Bool {
        
        return count > 25 // OLIVIER : Where does count come from ???
    }
}



/* PROTOCOL EXTENSIONS
 * Protocols let you describe what methods something should have ,
 * but don’t provide the code inside .
 * Extensions let you provide the code inside your methods ,
 * but only affect one data type
 * – you can’t add the method to lots of types at the same time .
 */
/* We use protocol extensions to add functionality directly to protocols ,
 * which means we don’t need to copy that functionality across many structs and classes .
 *
 */

protocol Politician {
    
    var isDirty: Bool { get set }
    func takeBribe()
}


extension Politician {
    
    func takeBribe() {
        if isDirty {
            print("Thank you very much!")
        } else {
            print("Someone call the police!")
        }
    }
}



/* PROTOCOL ORIENTED PROGRAMMING
 * Protocol-oriented programming is the practice of
 * designing your app architecture as a series of protocols ,
 * then using protocol extensions to provide default method implementations .
 */
/* POP developers lean heavily on the protocol extension functionality of Swift
 * to build types that get a lot of their behavior from protocols .
 * This makes it easier to share functionality across many types ,
 * which in turn lets us build bigger , more powerful software without having to write so much code .
 */

/* Protocols cannot countain other protocols .
 */
/* You can create one protocol by inheriting from others .
 * You can even inherit from multiple protocols if you want to .
 */
/* Only protocol extensions can contain method implementations .
 */

protocol HasAge {
    
    var age: Int { get set }
    mutating func celebrateBirthday() // OLIVIER : This works with a class as well .
}


class Child: HasAge {
    
    var age: Int
    
    init(age: Int) {
        self.age = age
    }
    
    func celebrateBirthday() {
        age += 1
    }
}
