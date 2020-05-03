//
//  File.swift
//  
//
//  Created by Stuart Breckenridge on 03/05/2020.
//

import Foundation
import UserNotifications
import Combine
#if os(iOS)
import UIKit
#endif
#if os(macOS)
import AppKit
#endif
#if os(watchOS)
import WatchKit
#endif
#if os(tvOS)
import TVUIKit
#endif

public enum NotificationManagerError: LocalizedError {
    
    case notAuthorised
    
    var localizedDescription: String {
        switch self {
            case .notAuthorised:
                return "Remote notifications are not authorised."
        }
    }
    
}

public typealias NotificationAuthorisationHandler = (Bool, Error?) -> Void

/// The `NotificationCentreManager` class is a wrapper around `UNUserNotification`.
@available(iOS 13, OSX 10.15, watchOS 6, tvOS 13, *)
public class NotificationCentreManager: NSObject, ObservableObject {
    
    // MARK: Published
    @Published public private(set) var currentSettings: UNNotificationSettings? = nil
    
    // MARK: Private
    private let centre = UNUserNotificationCenter.current()
    
    // MARK: Initialiser
    public static let `default` = NotificationCentreManager()
    override private init() {
        super.init()
        initialConfiguration()
    }
    
    /// Initial configuration obtains current settings and assigns those settings to a published property.
    private func initialConfiguration() {
        centre.getNotificationSettings(completionHandler: { settings in
            self.currentSettings = settings
        })
    }
    
    /// Wrapper around the `requestAuthorization` function of `UNUserNotificationCenter`.
    /// - Parameters:
    ///   - options: `UNAuthorizationOptions`
    ///   - completionHandler: `NotificationAuthorisationHandler`
    public func requestAuthorisation(options: UNAuthorizationOptions, completionHandler: @escaping NotificationAuthorisationHandler) {
        centre.requestAuthorization(options: options, completionHandler: { success, error  in
            completionHandler(success, error)
        })
    }
    
    /// Registers your device for remote notifications.
    /// - Throws: If the user has not authorised the device for remote notifications this function will throw an error.
    public func registerForRemoteNotifications() throws {
        guard let settings = self.currentSettings else {
            return
        }
        if settings.authorizationStatus != .authorized {
            throw NotificationManagerError.notAuthorised
        }
                
        #if os(iOS)
            UIApplication.shared.registerForRemoteNotifications()
        #endif
        
        #if os(macOS)
            NSApplication.shared.registerForRemoteNotifications()
        #endif
        
        #if os(watchOS)
            WKExtension.shared().registerForRemoteNotifications()
        #endif
            
        #if os(tvOS)
            UIApplication.shared.registerForRemoteNotifications()
        #endif
    }
    
    
}


