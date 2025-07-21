//
//  CartModel.swift
//  Mike_ShippingApp
//
//  Created by Mike Tshimbadi on 7/17/25.
//

import Foundation

struct CartModel: Identifiable, Codable {
    let id = UUID()
    let name: String
    let guestNumber: String
    let destination: String
    let ActivityDays: String
    let timeStamp: String
    let totalPrice: String
    let image: String
    
    static let cartList: [CartModel] = [
        CartModel(
            name: "Family Snorkel Adventure",
            guestNumber: "3 guests",
            destination: " Roatan, Honduras",
            ActivityDays: "Day 3",
            timeStamp: "2023-07-17 10:00:00",
            totalPrice: "$297.00",
            image: "roadPicture"),
    ]
}


