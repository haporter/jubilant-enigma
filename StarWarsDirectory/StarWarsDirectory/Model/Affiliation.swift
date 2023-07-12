//
//  Affiliation.swift
//  StarWarsDirectory
//
//  Created by Andrew Porter on 7/11/23.
//

import Foundation
import SwiftData

enum Affiliation: String, Decodable {
    case jedi = "JEDI"
    case resistance = "RESISTANCE"
    case firstOrder = "FIRST_ORDER"
    case sith = "SITH"
}
