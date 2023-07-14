//
//  DirectoryViewModel.swift
//  StarWarsDirectory
//
//  Created by Andrew Porter on 7/11/23.
//

import Foundation
import Combine
import SwiftUI
import SwiftData
import OSLog

@Observable
class DirectoryViewModel {
    
    let individuals: [Individual] = []
    
    let modelContext: ModelContext
    var bag = Set<AnyCancellable>()
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        
        fetch()
    }
    
    func fetch(forceRefresh: Bool = false) {
        let individuals = (try? modelContext.fetch(FetchDescriptor<Individual>())) ?? []
        guard forceRefresh || individuals.isEmpty else { return }
        
        DirectoryService().fetchIndividuals()
            .map(toSwiftDataModel(dto:))
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .sink { [weak self] values in
                values.forEach { self?.modelContext.insert($0) }
            }
            .store(in: &bag)
    }
    
    private func toSwiftDataModel(dto: [IndividualDTO]) -> [Individual] {
        dto.map(Individual.init(dto: ))
    }
}

extension Publisher {
    func logEvent(level: OSLogType, message: String) -> some Publisher<Output, Failure> {
        self
            .handleEvents(receiveOutput: { output in
                Logger.appLogger.info("\(message)")
            })
    }
}
