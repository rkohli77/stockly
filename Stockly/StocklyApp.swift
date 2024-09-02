//
//  StocklyApp.swift
//  Stockly
//
//  Created by Ritu Kohli on 2024-08-25.
//

import SwiftUI
import SwiftData

// Api key - KM2AH23VIVOKDBM6

@main
struct StocklyApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            let service: StocklyService = StocklyService()
            ContentView(viewModel: StocksViewModel(service: service))
        }
        .modelContainer(sharedModelContainer)
    }
}
