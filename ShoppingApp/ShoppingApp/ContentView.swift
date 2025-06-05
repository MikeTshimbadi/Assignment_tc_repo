//
//  ContentView.swift
//  ShoppingApp
//
//  Created by Mike Tshimbadi on 5/28/25.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    let categories: [String] = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    
    var body: some View {
        NavigationStack { // Updated to NavigationStack for modern SwiftUI
            VStack(alignment: .leading, spacing: 16) { // Consistent spacing
                
                HStack {
                    Button(action: {
//                        isMenuOpen.toggle()
//                        print("Hamburger menu tapped")
                    }) {
                        Image(systemName: "line.3.horizontal") // Hamburger icon
                            .foregroundColor(.primary)
                            .font(.title2)
                            .padding(5)
                            .background(Color(.systemGray6))
                            .clipShape(Circle())
                    }
                    .accessibilityLabel("Open menu")
                    
                    Spacer() // Pushes profile picture to the right
                    
                    Button(action: {
                        print("Profile tapped")
                    }) {
                        Image(systemName: "person.circle.fill") // Placeholder profile picture
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .foregroundColor(.gray)
                    }
                    .accessibilityLabel("User profile")
                }
                .padding(.horizontal, 16)
                Text("Find the \nBest **Furniture**")
                    .font(.title)
                    .foregroundColor(.brown) // Brown text color
                    .padding(.horizontal, 32)
                // Search Bar
                HStack(spacing: 8) {
                    TextField("Search Furniture", text: $searchText)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 32)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8),
                            alignment: .trailing
                        )
                    
                    Button(action: {
                        print("Scanning tapped")
                    }) {
                        Image(systemName: "barcode.viewfinder")
                            .foregroundColor(.blue)
                            .padding(10)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 16)
                
                // Categories ScrollView
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(categories, id: \.self) { category in // Use categories directly
                            Text(category)
                                .font(.title3)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                        }
                    }
                    .padding(.horizontal, 32)
                }
                
                // Popular Section
                Text("Popular")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal, 32)
                
                // List for Furniture Items
                List {
                    // Placeholder for list content
                    ForEach(0..<10) { index in // Example data
                        Text("Furniture Item \(index + 1)")
                            .padding(.vertical, 8)
                    }
                }
                .listStyle(.plain) // Clean list style
                .padding(.horizontal, 32)
                
                Spacer() // Pushes content to the top
            }
            // Top padding for better spacing
            // Dynamic Island-like Button Bar
            HStack(spacing: 20) {
                Button(action: {
                    print("Home tapped")
                }) {
                    Image(systemName: "house.fill")
                        .foregroundColor(.white)
                        .font(.title3)
                }
                .accessibilityLabel("Home")
                
                Button(action: {
                    print("Heart tapped")
                }) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.white)
                        .font(.title3)
                }
                .accessibilityLabel("Favorites")
                
                Button(action: {
                    print("Cart tapped")
                }) {
                    Image(systemName: "cart.fill")
                        .foregroundColor(.white)
                        .font(.title3)
                }
                .accessibilityLabel("Cart")
                
                Button(action: {
                    print("Person tapped")
                }) {
                    Image(systemName: "person.fill")
                        .foregroundColor(.white)
                        .font(.title3)
                }
                .accessibilityLabel("Profile")
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.black)
            .clipShape(Capsule())
            .shadow(radius: 5)
            .padding(.top, 12)
            .padding(.horizontal, 16)
            .zIndex(2) // Ensure island is above other content
        }
    }
}

#Preview {
    ContentView()
}
