//
//  Logging.swift
//  
//
//  Created by Stuart Breckenridge on 24/10/2022.
//

import Foundation
import os.log

/// The `Logging` Protocol provides a convenient way to
/// log your app's behaviour.
///
/// Types that conform to the `Logging` protocol
/// have access to a [`Logger`](https://developer.apple.com/documentation/os/logger)
/// variable or static variable.
/// The `logger` can be used to log messages about the
/// app's behaviour.
public protocol Logging {
    
    var logger: Logger { get }
    static var logger: Logger { get }
    
}

public extension Logging  {
    
    var logger: Logger {
        Logger(subsystem: Bundle.main.bundleIdentifier!, category: String(describing: type(of: self)))
    }
    
    static var logger: Logger {
        Logger(subsystem: Bundle.main.bundleIdentifier!, category: String(describing: type(of: self)))
    }
    
}
