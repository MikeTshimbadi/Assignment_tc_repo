/*
 interview questions
  1. what is dependency injection
  R. Dependency is a design pattern where one object provides the dependency of other object
     to avoid the creating an object of one class in an other taht can create an infinite loop
 
  2. difference types of dependency and advantage of it
  R. Dependency Initializer
        - it is immutable
        - the object is always in a valid state
    Instance dependency
        - It is flexible
        - support different framworks and library
        - it is good for testing and mocking
  3. when to use each type of injetcion
        a. Initializer dependency
        R. - Use when the dependency is essential and the object can't function without it.
           - it is a mandatory, it is used when it's mandatory. without it you can create a object.
           -
        b. function paramater depency
        R. to use when you need it in that particular option or function
  4. what is dependency inversion, explain with examples
  R. instead of using concrete dependency, use protocol for code reusability and it makes your code lousely coupled
  5. what are mandatory data function
  R.- NumberOfRolesInSection and cellForRowAt indexpath
 -----> func tableView(_ tableView: UITableView, 'numberOfRowsInSection' section: Int) -> Int {
     return 10
 }
 ----> func tableView(_ tableView: UITableView, 'cellForRowAt indexPath': IndexPath) -> UITableViewCell {
  6. what is advanatage of using dequeue Reusable cell with identifier
 
 */


class Engine {
    
}

class CarBody {
    
}

class FuelStation {
    
}

class Car {
    // mandatory use meaning the class car can't work without these functionality -> initializer dependency
    let engine: Engine
    let carBody: CarBody
    
    init(engine: Engine, carBody: CarBody) {
        self.engine = engine
        self.carBody = carBody
    }
    
    // function paramater injections
    func fuelEngine(fuelStation: FuelStation){
        
    }
}
