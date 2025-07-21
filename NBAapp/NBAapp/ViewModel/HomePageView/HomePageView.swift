//
//  HomePageView.swift
//  NBAapp
//
//  Created by Mike Tshimbadi on 6/13/25.
//

import Foundation

class HomePageViewModel: ObservableObject {
    @Published var teams: [NBAJsonModel] = []
    private let networkManager: Servicable
    @Published var imageData: [Data] = []
    
    init(networkManager: Servicable = NetworkManager()) {
        self.networkManager = networkManager
        
    }
    
    @MainActor
    func loadTeams() async {
        do {
            let fetchedTeams = try await networkManager.fetchTeams()
            self.teams = fetchedTeams
        } catch {
            print("Error fetching teams: \(error)")
        }
    }
    
}

    

