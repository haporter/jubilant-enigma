//
//  Network.swift
//  StarWarsDirectory
//
//  Created by Andrew Porter on 7/11/23.
//

import Foundation
import Combine

typealias Response = (Data, URLResponse)

protocol NetworkManagerType {
    func fetchData(at url: URL) -> AnyPublisher<Response, Error>
}

struct NetworkManager: NetworkManagerType {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchData(at url: URL) -> AnyPublisher<Response, Error> {
        session
            .dataTaskPublisher(for: url)
            .mapError { $0 }
            .map(\.data, \.response)
            .eraseToAnyPublisher()
    }
}
