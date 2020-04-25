//
//  JSONData+Utilities.swift
//  
//
//  Created by Stuart Breckenridge on 26/04/2020.
//

import Foundation


extension Encodable {
    
    /// This function returns data from `Encodable` types that can be used in URL requests.
    public func jsonData() throws -> Data {
        do {
            let json = try JSONSerialization.jsonObject(with: JSONEncoder().encode(self), options: .allowFragments)
            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            return data
        } catch {
            throw error
        }
    }
}


