// ---------------------------interview questions------------------------------------
// 1. what is the diff b/w var and let
// R. A var is a mutuable variable declaration and let is a constant variable declaration
// 2. how to create mutable and immutable variables
// R. using var for mutable and let for immutable
// 3. diff b/w explict and implicit variables
// R. an implicit variable is when a value is assigned at
// declaration w/o a data type -> var city = "LA"
// whereas explicit is when you declarate the variable and type prior to assigning valuesd
// 4. how to create optional variables
// R. By adding a ("?") to the end of the data type declaration -> String?
// 5. what is optional binding
// R. the process of unwraping optional
// 6. how to unwrap an optional
// R. using optional binding
// 7. diff b/w colasing, if let block, guard let
// R. colasing is when you assign a default value to a optional. it uses ("??")
// and if let verifies the velicity certain variables before doing something
// 8. diff b/w array and dict
// R. An arry is an ordered collection whereas dict is unorderd collection of key-value pair
// 9. diff b/w array and sets
// R. Array can contain duplicate where Set does not have any duplicate
// 10. can you assign a optional value to a none optional var if yes how, if no why?
// R. You can't assign an optional value to a non optional because
// they are not of the same type




import UIKit

// ----------question #1---------
// remove duplicate from the input string

var input = "abcabcasdf"

var result: Set<String> = []

 for char in input {
    result.insert(String(char))
}
print(result)
//var remove_set = Set(input)
//print(String(remove_set))

// ------------------question #2----------------------

var employees: [[String: Any]] = [
            ["fName":"Stephen",
             "lName":"Curry",
             "EmployeeID": 30,
             "JobTitle":"Point Guard",
             "deskNumber": 1],
            ["fName":"Moses",
             "lName":"Moody",
             "EmployeeID": 3,
             "JobTitle":"Shooting Guard",
             "deskNumber": 2],
            ["fName":"Jonathan",
             "lName":"Kuminga",
             "EmployeeID": 00,
             "JobTitle":"Small foward",
             "deskNumber": 2],
            ["fName":"Draymond",
             "lName":"Green",
             "EmployeeID": 23,
             "JobTitle":"Power Forward ",
             "deskNumber": 4],
            ["fName":"Jimmy",
             "lName":"Butler",
             "EmployeeID": 10,
             "JobTitle":"Center",
             "deskNumber": 5],
            ["fName":"Steve",
             "lName":"Kerr",
             "EmployeeID": 11,
             "JobTitle":"Coach",
             "deskNumber": 0],
            ["fName":"Jerry",
             "lName":"Stackhouse",
             "EmployeeID": 14,
             "JobTitle":"Assistant Coach",
             "deskNumber": 6],
            ["fName":"Mike",
             "lName":"Danlivy",
             "EmployeeID": 25,
             "JobTitle":"General Manager",
             "deskNumber": 7],
            ["fName":"Dave",
             "lName":"William",
             "EmployeeID": 15,
             "JobTitle":"Equip manager",
             "deskNumber": 20],
            ["fName":"Joe",
             "lName":"Lacob",
             "EmployeeID": 50,
             "JobTitle":"Owner",
             "deskNumber": 100],]


