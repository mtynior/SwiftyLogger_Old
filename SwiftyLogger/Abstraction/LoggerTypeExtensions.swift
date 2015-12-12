//
//  LoggerTypeExtensions.swift
//  Logging
//
//  Created by Michal on 12/12/15.
//  Copyright © 2015 Michal Tynior. All rights reserved.
//

import Foundation

public extension LoggerType {
    
    public func logDebug(message: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, timestamp: NSDate = NSDate()) {
        let logMessage = LogMessage(LogLevel.Debug, message, file, function, line, timestamp)
        
        log(logMessage)
    }
    
    public func logVerbose(message: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, timestamp: NSDate = NSDate()) {
        let logMessage = LogMessage(LogLevel.Verbose, message, file, function, line, timestamp)
        
        log(logMessage)
    }
    
    public func logInfo(message: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, timestamp: NSDate = NSDate()) {
        let logMessage = LogMessage(LogLevel.Info, message, file, function, line, timestamp)

        log(logMessage)
    }
    
    public func logWarning(message: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, timestamp: NSDate = NSDate()) {
        let logMessage = LogMessage(LogLevel.Warning, message, file, function, line, timestamp)

        log(logMessage)
    }
    
    public func logError(message: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, timestamp: NSDate = NSDate()) {
        let logMessage = LogMessage(LogLevel.Error, message, file, function, line, timestamp)
        
        log(logMessage)
    }
    
    public func logCritical(message: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, timestamp: NSDate = NSDate()) {
        let logMessage = LogMessage(LogLevel.Critical, message, file, function, line, timestamp)

        log(logMessage)
    }
    
}