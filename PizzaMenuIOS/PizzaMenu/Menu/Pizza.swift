import Foundation

struct Pizza {
    let name: String
    let base: [Base]
    let toppings: [Topping]
}

func isVegan(_ pizza: Pizza) -> Bool {
    return pizza.toppings.allSatisfy { !$0.isVegan }
}

func isGlutenFree(_ pizza: Pizza) -> Bool {
    let baseGlutenFree = pizza.base.allSatisfy { base in
        !base.allergens.contains { $0.lowercased() == "gluten" }
    }
    let toppingsGlutenFree = pizza.toppings.allSatisfy { topping in
        !topping.allergens.contains { $0.lowercased() == "gluten" }
    }
    return baseGlutenFree && toppingsGlutenFree
}



func getAllAllergens(from pizza: Pizza) -> [String] {
    let baseAllergens = pizza.base.flatMap { $0.allergens }
    let toppingAllergens = pizza.toppings.flatMap { $0.allergens }
    let allAllergens = Set(baseAllergens + toppingAllergens)
    return allAllergens.sorted()
}


func getOrderedToppings(_ pizza: Pizza) -> [Topping] {
    let sauces = pizza.toppings.filter { $0.type == .sauce }
    let cheeses = pizza.toppings.filter { $0.type == .cheese }
    let otherToppings = pizza.toppings
        .filter { $0.type == .topping }
        .sorted { $0.name.lowercased() < $1.name.lowercased() }

    return sauces + cheeses + otherToppings
}

