//
//  Affiliation.swift
//  StarWarsDirectory
//
//  Created by Andrew Porter on 7/11/23.
//

import Foundation
import SwiftData
import SwiftUI

enum Affiliation: String, Decodable {
    case jedi = "JEDI"
    case resistance = "RESISTANCE"
    case firstOrder = "FIRST_ORDER"
    case sith = "SITH"
    case muggle // 😉
    
    init(rawValue: String) {
        switch rawValue {
        case "JEDI":
            self = .jedi
        case "RESISTANCE":
            self = .resistance
        case "FIRST_ORDER":
            self = .firstOrder
        case "SITH":
            self = .sith
        default:
            self = .muggle
        }
    }
    
    var name: String {
        let value: String
        switch self {
        case .jedi:
            value = "Jedi"
        case .resistance:
            value = "Rebel Alliance"
        case .firstOrder:
            value = "First Order"
        case .sith:
            value = "Sith"
        case .muggle:
            value = ""
        }
        return value
    }
    
    var icon: ImageResource {
        let value: ImageResource
        switch self {
        case .jedi:
            value = .Icons.jedi
        case .resistance:
            value = .Icons.rebel
        case .firstOrder:
            value = .Icons.firstOrder
        case .sith:
            value = .Icons.sith
        case .muggle:
            value = .Icons.harry
        }
        return value
    }
    
    var color: Color {
        let value: Color
        switch self {
        case .jedi:
            value = .jediGreen
        case .resistance:
            value = .rebelBlue
        case .firstOrder:
            value = .firstOrderRed
        case .sith:
            value = .black
        case .muggle:
            value = .pink
        }
        return value
    }
}
