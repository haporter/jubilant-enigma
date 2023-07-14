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
    
    @State var sort: SortType = .firstName
    @State var route: [Route] = []
    @Query(sort: \.firstName, order: .forward) private var firstNameIndividuals: [Individual]
    @Query(sort: \._affiliation) private var affiliationIndividuals: [Individual]
    var viewModel: DirectoryViewModel
    
    var individuals: [Individual] {
        let value: [Individual]
        switch sort {
        case .firstName:
            value = firstNameIndividuals
        case .affiliation:
            value = affiliationIndividuals
        }
        return value
    }
    
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
            .toolbar(content: navBar)
        }
        .tint(.white)
    }
    
    @ToolbarContentBuilder
    func navBar() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Menu {
                Picker(selection: $sort) {
                    ForEach(SortType.allCases, id: \.self) { index in
                        Text(index.name)
                    }
                } label: { }
            } label: {
                Text("Sort")
                    .foregroundStyle(Color.primary)
            }
        }
    }
}

extension DirectoryListView {
    enum SortType: Int, CaseIterable {
        case firstName
        case affiliation
        
        var name: String {
            switch self {
            case .firstName:
                return "Name"
            case .affiliation:
                return "Affiliation"
            }
        }
    }
}
