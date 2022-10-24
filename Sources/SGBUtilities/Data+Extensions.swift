//
//  Data+Extensions.swift
//  
//
//  Created by Stuart Breckenridge on 24/10/2022.
//

import Foundation

public extension Data {
    
    /// Converts data to a hex string.
    var hexString: String {
        let hexString = map { String(format: "%02.2hhx", $0) }.joined()
        return hexString
    }
    
}
