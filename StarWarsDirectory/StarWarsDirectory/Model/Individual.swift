//
//  Individual.swift
//  StarWarsDirectory
//
//  Created by Andrew Porter on 7/12/23.
//

import Foundation
import SwiftData

@Model
class Individual {
    @Attribute(.unique) let id: Int
    let firstName: String
    let lastName: String?
    let birthdate: Date
    let profilePicture: URL
    let forceSensitive: Bool
    let _affiliation: String
    
    init(id: Int,
         firstName: String,
         lastName: String?,
         birthdate: Date,
         profilePicture: URL,
         forceSensitive: Bool,
         affiliation: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.birthdate = birthdate
        self.profilePicture = profilePicture
        self.forceSensitive = forceSensitive
        self._affiliation = affiliation
    }
    
    init(dto: IndividualDTO) {
        self.id = dto.id
        self.firstName = dto.firstName
        self.lastName = dto.lastName
        self.birthdate = dto.birthdate
        self.profilePicture = dto.profilePicture
        self.forceSensitive = dto.forceSensitive
        self._affiliation = dto.affiliation.rawValue
    }
    
    var affiliation: Affiliation {
        Affiliation(rawValue: _affiliation)
    }
    
    var fullName: String {
        firstName + " " + (lastName ?? "")
    }
}
