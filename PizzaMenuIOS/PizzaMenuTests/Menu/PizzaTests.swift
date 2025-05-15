import XCTest
@testable import PizzaMenu

class PizzaTests: XCTestCase {
    // Example bases
    private let thinAndCrispyBase = Base(name: "Thin and Crispy",
                                         isVegan: true,
                                         allergens: ["Gluten"])
    private let pepperoniStuffedCrust = Base(name: "Pepperoni Stuffed Crust",
                                             isVegan: false,
                                             allergens: ["Mustard", "Gluten"])
    private let allVeganBase = Base(name: "All Vegan",
                                    isVegan: true,
                                    allergens: [])
    private let glutenFreeBase = Base(name: "Gluten Free",
                                      isVegan: true,
                                      allergens: ["Gluten"])
    private let regularBase = Base(name: "Regular",
                                   isVegan: false,
                                   allergens: ["Gluten", "Milk"])  

    // Example toppings
    private let tomatoSauce = Topping(name: "Tomato sauce", type: .sauce, isVegan: true, allergens: [])
    private let bbqSauce = Topping(name: "Barbecue sauce", type: .cheese, isVegan: true, allergens: ["Mustard"])
    private let mozzarella = Topping(name: "Mozzarella", type: .cheese, isVegan: false, allergens: ["Milk"])
    private let mushroom = Topping(name: "Mushrooms", type: .topping, isVegan: true, allergens: [])
    private let pepperoni = Topping(name: "Pepperoni", type: .sauce, isVegan: false, allergens: ["Gluten", "Mustard"])

    func testWriteYourTestCodeHere() throws {
        func testIsVeganPizza() {
            let veganPizza = Pizza(name: "Vegan Special",
                                   base: [allVeganBase],
                                   toppings: [tomatoSauce, mushroom])
            
            XCTAssertTrue(isVegan(veganPizza))
        }

        func testIsNotVeganPizza() {
            let nonVeganPizza = Pizza(name: "Cheesy Meat",
                                      base: [regularBase],
                                      toppings: [mozzarella, pepperoni])
            
            XCTAssertFalse(isVegan(nonVeganPizza))
        }

        func testIsGlutenFreePizza() {
            let gfPizza = Pizza(name: "Gluten-Free Delight",
                                base: [glutenFreeBase],
                                toppings: [mushroom])
            
            XCTAssertTrue(isGlutenFree(gfPizza))
        }
        
//        func testIsNotGlutenFreePizza() {
//            let nonGluetenFree = Pizza(name: "Meaty Delight",
//                                       base: [regularBase],
//                                       toppings: [mushroom]
//        }

        func testAllergensSorted() {
            let pizza = Pizza(name: "Allergen Pizza",
                              base: [regularBase],
                              toppings: [mozzarella, bbqSauce, pepperoni])
            
            let expectedAllergens = ["Gluten", "Milk", "Mustard"]
            let allergens = getAllAllergens(from: pizza)
            
            XCTAssertEqual(allergens, expectedAllergens)
        }

        func testOrderedToppings() {
            let pizza = Pizza(name: "Mixed Pizza",
                              base: [thinAndCrispyBase],
                              toppings: [mushroom, mozzarella, tomatoSauce, pepperoni])
            
            let sorted = getOrderedToppings(pizza).map { $0.name }
            let expectedOrder = ["Tomato sauce", "Mozzarella", "Mushrooms", "Pepperoni"] // sauce → cheese → toppings
            XCTAssertEqual(sorted, expectedOrder)
        }

    }
}
