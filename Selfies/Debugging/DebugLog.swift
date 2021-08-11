//
//  DebugLog.swift
//  Selfies
//
//  Created by Andy Nadal on 8/10/21.
//

import Foundation

/// The location of an unintended or unexpected behavior.
public enum DebugModule: String { case mainTable, graphs, networking }

/// A function to log an error, or unexpected behavior message,
/// this could be further extended to log those messages in a server.
/// - Parameters:
///   - message: "Description of the unintended behavior"
///   - module: "An optional `DebugModule`, where the behavior occurred"
///   - error: "Optional, if the system provides an `Error`, in can be logged here"
public func debugLog(_ message: String, in module: DebugModule? = nil, with error: Error? = nil) {
    var moduleString = ""
    var errorString = ""
    
    if let module = module {
        moduleString = "[\(module.rawValue)]"
    }
    
    if let error = error {
        errorString = "with error message: \(error.localizedDescription)"
    }

    print("DEBUG:", moduleString, message, errorString)
}
