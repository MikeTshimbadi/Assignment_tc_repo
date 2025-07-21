//
//  HomePage.swift
//  NBAapp
//
//  Created by Mike Tshimbadi on 6/13/25.
//

import SwiftUI

struct HomePage: View {
    
    @StateObject var viewModel = HomePageViewModel()  // ViewModel to manage the state and data fetching
    let title: String // Title for the navigation bar
    var coordinator: Coordinator
    var onPlayerTap: ((NBAJsonModel) -> Void)?  // Closure to handle player taps or navigation
    
    // State variables for alert and search functionality
    @State private var showAlert = false
    @State private var selectedTeam = ""
    @State private var searchText = ""
    
    var filteredTeams: [NBAJsonModel] {
        searchText.isEmpty ? viewModel.teams : viewModel.teams.filter {
            $0.teamName.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        List(filteredTeams) { team in
            HStack {
                AsyncImage(url: team.image) { image in
                    image.resizable().aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(team.teamCity).bold()
                    Text(team.teamName)
                    Text(team.teamAbv)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                selectedTeam = team.teamName
                showAlert = true
                onPlayerTap?(team)
            }
        }
        .navigationTitle(title)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Team Selected"),
                message: Text("\(selectedTeam)"),
                dismissButton: .default(Text("OK"))
            )
        }
        .searchable(text: $searchText)
        .task {
            await viewModel.loadTeams()
        }
    }
}
