//
//  LoggerFactory.swift
//  Logging
//
//  Created by Michal on 12/12/15.
//  Copyright © 2015 Michal Tynior. All rights reserved.
//

import Foundation

public class LoggerFactory: LoggerFactoryType {
    
    private var _loggers = [String : LoggerType]()
    
    public var loggerTargets = [LoggerTargetType]()
    
    public var minimumLogLevel: LogLevel = LogLevel.Debug
   
    public var messageFormatter: LogMessageFormatterType = DefaultLogMessageFormatter()
    
    public init() { } 
    
    public func createLogger(loggerName: String) -> LoggerType {
        if let logger = _loggers[loggerName] {
            return logger
        }
        else {
            _loggers[loggerName] = Logger(self)
            return _loggers[loggerName]!
       }
    }
    
    public func addTarget(target: LoggerTargetType) -> Void {
        loggerTargets.append(target)
    }
    
}