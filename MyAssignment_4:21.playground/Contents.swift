
// ------------------------------ interview questions ----------------------
//1. diff type of initializers
// R. - Disagnated initializer
//    - Convience initializer

//2. diff b/w designated initializer and convenience intializer. Explain with an example
//R. - Designated initializer ensure that store property are initialize
//   - Convenience initializer must call another initializer from the same class
//   - classes might or might not have a convenience initizlizer but it must have a disignated initializer
//   - convience initializer provide shortcuts or simple ways to initialize

// ------- disignated initializer ------
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

// -------- convenience initializer -------------

class Person1 {
    var name: String
    
    init(name: String){
        self.name = name
    }
    
    convenience init() {
        self.init(name: "John doe")
    }
}

//3. diiff b/w if let and guard let
//R. - in if let the variabl scope exist only inside the if block, but with guard let it is available even after the guard block
//   - if let unwrap the optianal only if it's non-nil whereas guard let is used to exiy early if the value is nil

//4. what is closure
//R. It is a hybrid of variable and function

//5. different types of closure
//R. There are four types: non escaping, escaping, trailing, Auto closure

//6. diff b/w escaping and non esacping
//R. - the escaping closure keep the closure in memory after the function call and the non escaping excutes within the function it's passed meaning can't store it for later use
//   - the non escaping does not require the keyword "escaping" but the escaping closure does

//7. what is auto closure
//R. It automatically wraps an expression in a closure

//8. are closure reference type of value type
//R. closure are reference type

//9. what is generics
//R. it allows to write resubale code without declaring a type instead of rewriting the same code for different data types

//10. enum, protocol, collection type: are these reference type of value type
//R. - enum are value type because it behaves like struct
//   - Protocol conforms to the type because it is just a bleuprint
//   - collections are value type because they copy the value and create a new memory in the stack
