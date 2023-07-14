//
//  Logger+Extension.swift
//  StarWarsDirectory
//
//  Created by Andrew Porter on 7/13/23.
//

import Foundation
import OSLog

extension Logger {
    static var appLogger: Logger {
        Logger(subsystem: "com.directory", category: "Directory")
    }
}
