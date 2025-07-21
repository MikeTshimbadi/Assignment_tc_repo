//
//  SchedulesPageView.swift
//  NBAapp
//
//  Created by Mike Tshimbadi on 6/16/25.
//

import SwiftUI

struct TeamRoster: View {
    
    @StateObject var viewModel = RosterList()
    let rosters: [Roster]
    var team: String
    @State private var searchText = ""
    
    var filteredTeams: [Roster] {
        searchText.isEmpty ? viewModel.rosters : viewModel.rosters.filter {
            $0.longName.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        List(filteredTeams) { roster in
            VStack(alignment: .leading) {
                Text(roster.longName)
                    .font(.headline)
                Text("Position: \(roster.pos) for \(roster.team)" )
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
