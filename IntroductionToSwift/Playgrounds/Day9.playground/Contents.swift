import Foundation


/* DAY 9
 * STRUCTS , PART 2
 */


/* INITIALIZERS
 * Swift removes the memberwise initializer if you create an initializer of your own :
 */

struct Employee {
    var name: String
    var yearsActive = 0
    
    init() {
        name = "Anonymous"
        print("Creating an anonymous employee .")
    }
}

let employee = Employee()

/* With that in place ,
 * I could no longer rely on the memberwise initializer , so this would no longer be allowed :
 */
//let anotherEmployee = Employee(name : "Glinda") // ERROR


/* If you want it to stay ,
 * move your custom initializer to an extension , like this :
 */

struct Employee2 {
    var name: String
    var yearsActive: Int = 0
}

extension Employee2 {
    init() {
        name = "Anonymous"
        print("Creating an anonymous employee .")
    }
}

let employeeA = Employee2()
let employeeB = Employee2(name : "Glinda")
let employeeC = Employee2(name : "Ozma" ,
                          yearsActive : 2)



/* SELF
 * Inside a method ,
 * Swift lets us refer to the current instance of a struct using self ,
 * but broadly speaking you don’t want to
 * unless you specifically need to distinguish what you mean .
 */
/* You don’t have to use that , of course ,
 * but it gets a little clumsy adding some sort of prefix to the parameter names :
 */


struct Student {
    var name: String
    var bestFriend: String
    
    init(name studentName: String ,
         bestFriend studentBestFriend: String) { // OLIVIER : Note how I can also make use of external and internal parameternames .
        
        print("Enrolling \(studentName) in class ...")
        name       = studentName
        bestFriend = studentBestFriend
    }
}


let student1 = Student(name : "Dorothy" ,
                       bestFriend : "Gale")

/* Outside of initializers ,
 * the main reason for using self is because we are in a closure
 * and Swift requires us to so we are making it clear we understand what is happening .
 */



/* LAZY PROPERTIES
 * Lazy properties are created only when first accessed .
 */
/* Swift’s lazy properties let us delay the creation of a property until it is actually used ,
 * which makes them like a computed property . However ,
 * unlike a computed property they store the result that gets calculated ,
 * so that subsequent accesses to the property don’t redo the work .
 * This allows them to provide extra performance when they aren’t used (because their code is never run) ,
 * and extra performance when they are used repeatedly (because their value is cached .)
 */
/* There are a few reasons why you would prefer stored or computed properties over a lazy property , such as :
 * 1. Using lazy properties can accidentally produce work where you don’t expect it . For example ,
 *    if you’re building a game and access a complex lazy property for the first time it might cause your game to slow down ,
 *    so it’s much better to do slow work up front and get it out of the way .
 * 2. Lazy properties always store their result ,
 *    which might either be unnecessary (because you aren’t use it again)
 *    or be pointless (because it needs to be recalculated frequently) .
 * 3. Because lazy properties change the underlying object they are attached to ,
 *    you can’t use them on constant structs .
 */
/* TIP
 * You can assign lazy properties by calling a method . This can help keep your code more organized .
 */



/* STATIC PROPERTIES AND METHODS
 * You can also ask Swift to share specific properties and methods
 * across all instances of the struct
 * by declaring them as
 * static .
 */

struct Student2 {
    
    static var classSize: Int = 0
    
    var name: String
    
    
    init(name: String) {
        self.name = name
        
        Student2.classSize += 1
        // Because the classSize property belongs to the struct itself rather than instances of the struct , we need to read it using Student.classSize .
    }
}


struct Question {
    
    static var answer = 42
    var questionText = "Unknown"
    
    init(questionText: String ,
         answer: Int) {
        
        self.questionText = questionText
        Question.answer   = answer
    }
}



struct NewsStory {
    
    static var breakingNewsCount = 0
    static var regularNewsCount = 0
    var headline: String
    
    init(headline: String ,
         isBreaking: Bool) { // OLIVIER : Take note of how I am able to have an extra argument in the initializer only .
        
        self.headline = headline
        
        if isBreaking {
            NewsStory.breakingNewsCount += 1
        } else {
            NewsStory.regularNewsCount += 1
        }
    }
}



struct Cat {
    static var allCats = [Cat]()
    
    init() {
        Cat.allCats.append(self)
    }
    
    static func chorus() {
        for _ in allCats {
            print("Meow!")
        }
    }
}
