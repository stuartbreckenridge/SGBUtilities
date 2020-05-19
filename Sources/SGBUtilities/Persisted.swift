//
//  Persisted.swift
//  
//
//  Created by Stuart Breckenridge on 19/05/2020.
//

import Foundation
import Combine

@propertyWrapper
public struct Persisted<T> {
    private let key: String
    private let notificationName: Notification.Name
    private let defaultValue: T
    
    
    public init(key: String, notificationName: Notification.Name, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    public var wrappedValue: T {
        get {
            // Read value from UserDefaults
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            // Set value to UserDefaults
            UserDefaults.standard.set(newValue, forKey: key)
            NotificationCenter.default.post(name: notificationName, object: nil)
        }
    }
}
