//
//  Individuals.swift
//  StarWarsDirectory
//
//  Created by Andrew Porter on 7/11/23.
//

import Foundation
import SwiftData

@Model
struct Individual: Identifiable {
    @Attribute(.unique) let id: Int
    let firstName: String
    let lastName: String?
    let birthdate: Date
    let profilePicture: URL
    let forceSensitive: Bool
    let affiliation: Affiliation
    
    init(id: Int, firstName: String,
         lastName: String?,
         birthdate: Date,
         profilePicture: URL,
         forceSensitive: Bool,
         affiliation: Affiliation) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.birthdate = birthdate
        self.profilePicture = profilePicture
        self.forceSensitive = forceSensitive
        self.affiliation = affiliation
    }
}
