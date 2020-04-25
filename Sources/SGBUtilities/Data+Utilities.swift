//
//  Data+Utilities.swift
//  
//
//  Created by Stuart Breckenridge on 25/04/2020.
//

import Foundation


public extension Data {
    
    /// Converts data to a hex string.
    var hexString: String {
        let hexString = map { String(format: "%02.2hhx", $0) }.joined()
        return hexString
    }
}


