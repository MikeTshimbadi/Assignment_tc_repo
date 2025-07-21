//
//  RosterList.swift
//  NBAapp
//
//  Created by Mike Tshimbadi on 6/17/25.
//

import Foundation

class RosterList: ObservableObject {
    @Published var rosters: [Roster] = []
    private let networkManager: Servicable
    
    init(networkManager: Servicable = NetworkManager()) {
        self.networkManager = networkManager
        
    }
    @MainActor
    func loadRoster() async {
        do {
            let fetchedRosters = try await networkManager.fetchRoster()
            self.rosters = fetchedRosters
        } catch {
            print("Error fetching teams: \(error)")
        }
    }
}
