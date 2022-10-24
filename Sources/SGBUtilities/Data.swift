//
//  Data.swift
//  
//
//  Created by Stuart Breckenridge on 24/10/2022.
//

import Foundation


/// This protocol surfaces a `hexValue` variable
/// which is a hexed representation of `Data`.
///
/// - Important: `Data` conforms to the `Hexable` protocol.
public protocol Hexable {
    var hexValue: String { get }
}

/// Useful `Data` extensions.
extension Data: Hexable {
    
    /// Converts data to a hex string.
    public var hexValue: String {
        let hex = map { String(format: "%02.2hhx", $0) }.joined()
        return hex
    }
    
}
