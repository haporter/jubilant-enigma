//
//  Individuals.swift
//  StarWarsDirectory
//
//  Created by Andrew Porter on 7/11/23.
//

import Foundation

struct IndividualDTO: Decodable {
    let id: Int
    let firstName: String
    let lastName: String?
    let birthdate: Date
    let profilePicture: URL
    let forceSensitive: Bool
    let affiliation: Affiliation
}
