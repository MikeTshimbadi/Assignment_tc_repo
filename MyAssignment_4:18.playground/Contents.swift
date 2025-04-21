// --------------------------------- interview questions ----------------------------------
// 1. diff b/w struct and class
// R. - class are reference type and struct are value type
//    - class allows inheritence and struct does not
//    - class obj are stored in heap memory and struct are stored in stack memory
// 2. what is reference type and value type. Explain with a example
// R. - A reference type copies the reference of a memory and point to the same memory address
//    - and value type create a new memmory address
// 3. why structs faster compare to classess
// R. Because structs are stored in a stack memory and classes are stored in a heap memory
// how to mutate structs
// R. by adding the "mutating" keywords before the function
// 5. what is the use of mutating keyword
// R. To allow a function to be mutable
// 6. what is enum
// R. it represent a collection of related values together
// 7. what is associated type
// R. In enum is when we can pass additional value to each case
// 8. diff b/w associated type and raw type
// R. - Associated type can pass additional value to the case but
//    - raw type is difined anc you can't change it
// 9. what is protocol
// R. Protocol is a blueprint of methods and variable. It can't be access directly
// 10. what is the use protocol
// R. it allows mutiple implementation of the same function when needed.
// 11. what is extension
// R. It is function that allows protocol field to be optional function
// 12. how to make a func optional in protocol
// R. By creating a extension
// 13. diff b/w heap and stack memory
// R. - A heap memory is dynamic and stack memory is fixed
//    - A stack memmory works faster than a heap memory
// 14. where struct obj get stored and where does classes obj get stored
// R. Struct obj are stored in stack memory and classes are store in heap memory


import UIKit

// create a calculator class with basic mathematics operations define first rules using protocol

protocol Calculator {
    func add(a: Double, b: Double) -> Double
    func subtract(a: Double, b: Double) -> Double
    func multiply(a: Double, b: Double) -> Double
    func divide(a: Double, b: Double) -> Double
}


class BasicCalculator: Calculator {
    var x, y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    func add(a: Double, b: Double) -> Double {
        return x + y
    }
    
    func subtract(a: Double, b: Double) -> Double {
        return x - y
    }
    
    func multiply(a: Double, b: Double) -> Double {
        return x * y
    }
    
    func divide(a: Double, b: Double) -> Double {
        return x / y
    }

}

let calc = BasicCalculator(x: 20, y: 10)
print(calc.add(a: 10, b: 20))
print(calc.subtract(a: 10, b: 20))
print(calc.multiply(a: 10, b: 20))
print(calc.divide(a: 10, b: 20))



// create a interger array and write sorting logic (use any best sorting algorithm, don't use inbuild sort function)

var numbers: [Int] = [64, 34, 25, 12, 22, 11, 90]

// bubble sort
func bubbleSort(arr: inout [Int]) {
    for i in 0..<arr.count {
        for j in 0..<(arr.count - i - 1) {
            if (arr[j] > arr[j+1]) {
                var temp = 0
                temp = arr[j+1]
                arr[j+1] = arr[j]
                arr[j] = temp
            }
        }
    }
}

bubbleSort(arr: &numbers)
print(numbers)


