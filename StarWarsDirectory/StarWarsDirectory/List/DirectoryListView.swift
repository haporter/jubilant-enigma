//
//  DirectoryListView.swift
//  StarWarsDirectory
//
//  Created by Andrew Porter on 7/12/23.
//

import SwiftUI
import SwiftData

enum Route: Hashable {
    case individualDetail(Individual)
}

struct DirectoryListView: View {
    
    @State var route: [Route] = []
    @Query(sort: \.firstName, order: .forward) private var individuals: [Individual]
    var viewModel: DirectoryViewModel
    
    init(viewModel: DirectoryViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack(path: $route) {
            List(individuals) { element in
                Button {
                    route.append(.individualDetail(element))
                } label: {
                    IndividualCellView(individual: element)
                        .alignmentGuide(.listRowSeparatorLeading) { d in
                            d[.leading]
                        }
                }
            }
            .refreshable {
                viewModel.fetch(forceRefresh: true)
            }
            .listStyle(.plain)
            .navigationDestination(for: Route.self) { value in
                switch value {
                case .individualDetail(let individual):
                    IndividualDetailView(individual: individual)
                }
            }
            .navigationTitle("Directory")
        }
        .tint(.white)
    }
}

