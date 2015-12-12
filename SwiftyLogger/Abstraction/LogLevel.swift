//
//  LogLevel.swift
//  Logging
//
//  Created by Michal on 12/12/15.
//  Copyright © 2015 Michal Tynior. All rights reserved.
//

import Foundation

public enum LogLevel: Int {
    
    case Debug
    case Verbose
    case Info
    case Warning
    case Error
    case Critical
    
    public func toString() -> String {
        let level: String
        
        switch(self) {
        case .Debug:
            level = "Debug"
        case .Verbose:
            level = "Verbose"
        case .Info:
            level = "Info"
        case .Warning:
            level = "Warning"
        case .Error:
            level = "Error"
        case .Critical:
            level = "Critical"
        }
        
        return level
    }
}