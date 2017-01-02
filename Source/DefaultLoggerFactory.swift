//
//  DefaultLoggerFactory.swift
//  SwiftyLogger
//
//  Created by Michal Tynior on 24/10/2016.
//  Copyright © 2016 Michał Tynior. All rights reserved.
//

import Foundation

public class DefaultLoggerFactory: LoggerFactory {
    
    public var loggerTargets = [LoggerTarget]()
    
    public var minimumLogLevel: LogLevel = LogLevel.debug
    
    public var messageFormatter: LogMessageFormatter = DefaultLogMessageFormatter()
    
    
    public init() { }
    
    public func makeLogger() -> Logger {
        return  DefaultLogger(loggerFactory: self)
    }
    
    public func addTarget(_ target: LoggerTarget) -> LoggerFactory {
        loggerTargets.append(target)
        return self
    }
    
}
    
