//
//  ContentView.swift
//  StarWarsDirectory
//
//  Created by Andrew Porter on 7/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        Text("HELLO WORLD")
    }
}

#Preview {
    ContentView()
}
