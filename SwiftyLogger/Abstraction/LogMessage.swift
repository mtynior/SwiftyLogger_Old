//
//  LogMessage.swift
//  Logging
//
//  Created by Michal on 12/12/15.
//  Copyright © 2015 Future Processing. All rights reserved.
//

import Foundation

public struct LogMessage {
    
    public var logLevel: LogLevel
    public var message: String
    public var file: String
    public var function: String
    public var line: Int
    public var timestamp: NSDate
    
    init (_ logLevel: LogLevel = LogLevel.Debug, _ message: String = "", _ file: String = "", _ function: String = "", _ line: Int = 0, _ timestamp: NSDate = NSDate() ) {
        self.logLevel = logLevel
        self.message = message
        self.file = file
        self.function = function
        self.line = line
        self.timestamp = timestamp
    }
    
}