//
//  LoggerExtensions.swift
//  SwiftyLogger
//
//  Created by Michal Tynior on 24/10/2016.
//  Copyright © 2016 Michał Tynior. All rights reserved.
//

import Foundation

public extension Logger {
    
    public func logDebug(_ message: String, file: String = #file, function: String = #function, line: Int = #line, timestamp: Date = Date(), threadName: String? = nil) {
        
        let currentThread = threadName ?? currentThreadName()
        let logMessage = LogMessage(LogLevel.debug, message, file, function, line, timestamp, currentThread)
        
        log(logMessage)
    }
    
    public func logVerbose(_ message: String, file: String = #file, function: String = #function, line: Int = #line, timestamp: Date = Date(), threadName: String? = nil) {
        
        let currentThread = threadName ?? currentThreadName()
        let logMessage = LogMessage(LogLevel.verbose, message, file, function, line, timestamp, currentThread)
        
        log(logMessage)
    }
    
    public func logInfo(_ message: String, file: String = #file, function: String = #function, line: Int = #line, timestamp: Date = Date(), threadName: String? = nil) {
        
        let currentThread = threadName ?? currentThreadName()
        let logMessage = LogMessage(LogLevel.info, message, file, function, line, timestamp, currentThread)
        
        log(logMessage)
    }
    
    public func logWarning(_ message: String, file: String = #file, function: String = #function, line: Int = #line, timestamp: Date = Date(), threadName: String? = nil) {
        
        let currentThread = threadName ?? currentThreadName()
        let logMessage = LogMessage(LogLevel.warning, message, file, function, line, timestamp, currentThread)
        
        log(logMessage)
    }
    
    public func logError(_ message: String, file: String = #file, function: String = #function, line: Int = #line, timestamp: Date = Date(), threadName: String? = nil) {
        
        let currentThread = threadName ?? currentThreadName()
        let logMessage = LogMessage(LogLevel.error, message, file, function, line, timestamp, currentThread)
        
        log(logMessage)
    }
    
    public func logCritical(_ message: String, file: String = #file, function: String = #function, line: Int = #line, timestamp: Date = Date(), threadName: String? = nil) {
        
        let currentThread = threadName ?? currentThreadName()
        let logMessage = LogMessage(LogLevel.critical, message, file, function, line, timestamp, currentThread)
        
        log(logMessage)
    }
    
    fileprivate func currentThreadName() -> String {
        #if os(Linux)
            return ""
        #else
            if Thread.isMainThread {
                return "Main"
            } else {
                let threadName = Thread.current.name
                if let threadName = threadName, !threadName.isEmpty {
                    return threadName
                } else {
                    return String(format: "%p", Thread.current)
                }
            }
        #endif
    }

}
