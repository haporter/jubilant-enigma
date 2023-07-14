//
//  ContentView.swift
//  StarWarsDirectory
//
//  Created by Andrew Porter on 7/11/23.
//

import SwiftUI
import SwiftData
import Combine

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var isLoading: Bool = true
    
    var body: some View {
        if isLoading {
            LoadingView()
                .contentTransition(.opacity)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                        withAnimation {
                            isLoading.toggle()
                        }
                    }
                }
        } else {
            DirectoryListView(viewModel: .init(modelContext: modelContext))
                .contentTransition(.opacity)
        }
    }
}
