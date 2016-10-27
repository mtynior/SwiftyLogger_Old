//
//  LogLevel.swift
//  SwiftyLogger
//
//  Created by Michal Tynior on 24/10/2016.
//  Copyright © 2016 Michał Tynior. All rights reserved.
//

import Foundation

public enum LogLevel: Int {
    
    case debug
    case verbose
    case info
    case warning
    case error
    case critical
    
}

extension LogLevel: CustomStringConvertible {
    
    public var description: String {
        let level: String
        
        switch(self) {
        case .debug:
            level = "Debug"
        case .verbose:
            level = "Verbose"
        case .info:
            level = "Info"
        case .warning:
            level = "Warning"
        case .error:
            level = "Error"
        case .critical:
            level = "Critical"
        }
        
        return level

    }
    
}
