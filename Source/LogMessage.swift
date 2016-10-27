//
//  LogMessage.swift
//  SwiftyLogger
//
//  Created by Michal Tynior on 24/10/2016.
//  Copyright © 2016 Michał Tynior. All rights reserved.
//

import Foundation

public struct LogMessage {
    
    public var logLevel: LogLevel
    
    public var message: String
    
    public var file: String
    
    public var function: String
    
    public var line: Int
    
    public var timestamp: Date
    
    public var threadName: String
    
    
    public init (_ logLevel: LogLevel = LogLevel.debug, _ message: String = "", _ file: String = "", _ function: String = "", _ line: Int = 0, _ timestamp: Date = Date(), _ threadName: String = "") {
        self.logLevel = logLevel
        self.message = message
        self.file = file
        self.function = function
        self.line = line
        self.timestamp = timestamp
        self.threadName = threadName
    }
    
}
