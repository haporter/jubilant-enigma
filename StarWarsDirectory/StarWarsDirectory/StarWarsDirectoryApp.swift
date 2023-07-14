//
//  StarWarsDirectoryApp.swift
//  StarWarsDirectory
//
//  Created by Andrew Porter on 7/11/23.
//

import SwiftUI
import SwiftData

@main
struct StarWarsDirectoryApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Individual.self)
        }
    }
}
