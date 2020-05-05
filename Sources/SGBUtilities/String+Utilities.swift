//
//  String+Utilities.swift
//  
//
//  Created by Stuart Breckenridge on 05/05/2020.
//

import Foundation

public extension String {

    func extractedString(line: String) -> String? {
        let pattern = "[0-9]{4}hrs"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let matches = regex.matches(in: self, range: NSMakeRange(0, self.utf16.count))
        let results = zip(matches, matches.dropFirst().map { Optional.some($0) } + [nil]).map { current, next -> String in
            let range = current.range(at: 0)
            let start = String.Index(utf16Offset: range.location, in: self)
            let end = next.map { $0.range(at: 0) }.map { String.Index(utf16Offset: $0.location, in: self) } ?? String.Index(utf16Offset: self.utf16.count, in: self)
            
            return String(self.utf16[start..<end])!
        }
        
        let res = dump(results)
        let filter = res.filter({ $0.contains(line.uppercased()) })
        if filter.count > 0 {
            return filter[0]
        }
        return nil
    }
    
}
