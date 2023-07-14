//
//  DirectoryService.swift
//  StarWarsDirectory
//
//  Created by Andrew Porter on 7/11/23.
//

import Foundation
import Combine

protocol DirectoryServiceType {
    func fetchIndividuals() -> AnyPublisher<[IndividualDTO], Error>
}

struct DirectoryService: DirectoryServiceType {
    
    let network: NetworkManagerType
    
    init(network: NetworkManagerType = NetworkManager()) {
        self.network = network
    }
    
    func fetchIndividuals() -> AnyPublisher<[IndividualDTO], Error> {
        network
            .fetchData(at: .individualsEndpoint)
            .map(\.0)
            .decode(type: IndividualsDTO.self, decoder: JSONDecoder.individualsDecoder)
            .map(\.individuals)
            .eraseToAnyPublisher()
    }
}

private extension URL {
    static var individualsEndpoint: URL {
        URL(string: "https://edge.ldscdn.org/mobile/interview/directory")!
    }
}

private struct IndividualsDTO: Decodable {
    let individuals: [IndividualDTO]
}
