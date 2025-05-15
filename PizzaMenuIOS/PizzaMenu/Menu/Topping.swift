import Foundation

enum ToppingType: String, CaseIterable {
    case sauce
    case cheese
    case topping
}

struct Topping {
    let name: String
    let type: ToppingType
    let isVegan: Bool
    let allergens: [String]
}
