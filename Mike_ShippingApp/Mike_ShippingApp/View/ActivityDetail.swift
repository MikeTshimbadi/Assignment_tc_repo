//
//  ActivityDetail.swift
//  Mike_ShippingApp
//
//  Created by Mike Tshimbadi on 7/17/25.
//

import SwiftUI

struct ActivityDetail: View {
    var cartItem: CartModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(cartItem.name)
                .font(.headline)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    LabelView(label: "Guests", value: cartItem.guestNumber)
                    LabelView(label: "Day", value: "\(cartItem.ActivityDays) - \(cartItem.destination)")
                    LabelView(label: "Time", value: cartItem.timeStamp)
                }
                
                Spacer()
                
                VStack {
                    Image(cartItem.image)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(8)
                    
                   
                    Button(action: {
                        // Modify action
                    }) {
                        Text("Modify")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.blue)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 6)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.blue, lineWidth: 1)
                            )
                    }

                    Button(action: {

                    }) {
                        Text("Remove")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.blue)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.blue, lineWidth: 1)
                            )
                    }

                }
            }
            
            VStack {
                Text(cartItem.totalPrice)
                    .bold()
            
                Text("Price details >")
                    .foregroundColor(.blue)
                    .font(.subheadline)
            }
            Divider()
        }
        .padding(.vertical)
    }
}

struct LabelView: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text(value)
                .font(.subheadline)
        }
    }
}


#Preview {
    ActivityDetail(cartItem: CartModel.cartList[0])
}
