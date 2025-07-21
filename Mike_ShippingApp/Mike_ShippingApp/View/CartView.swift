//
//  ContentView.swift
//  Mike_ShippingApp
//
//  Created by Mike Tshimbadi on 7/17/25.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        VStack {
            // Top Header
            ZStack(alignment: .topLeading) {
                Color.white.ignoresSafeArea() // Optional
    
                HStack{
                    Button(action: {
                        print("Dismiss Cart")
                    }) {
                        Image(systemName: "xmark")
                            .padding()
                            .foregroundColor(.blue)
                            .font(.title2)
                    }
                    // Centered Cart Info
                    VStack(alignment: .center) {
                        Spacer().frame(height: 5)
                        
                        VStack {
                            Text("Day 1 • Ship time: 11:41 AM")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text("Cart")
                                .font(.title2)
                                .bold()
                        }.frame(maxWidth: .infinity)
                        
                    }
                }
            }
            .frame(height: 50)
            Divider()
            
            // Cart Items
            List {
                ForEach(CartModel.cartList) { item in
                    ActivityDetail(cartItem: item)
                }
            }
            .listStyle(PlainListStyle())
            
            VStack(spacing: 10) {
                HStack {
                    Text("Order summary ▾")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                    Spacer()
                    Text("$297.00")
                        .bold()
                }
                
                Button(action: {
                    // Add checkout logic
                }) {
                    Text("Checkout")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}


#Preview {
    CartView()
}
