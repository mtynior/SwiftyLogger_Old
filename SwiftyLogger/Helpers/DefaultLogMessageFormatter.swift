//
//  DefaultLogMessageFormatter.swift
//  Logging
//
//  Created by Michal on 28/08/15.
//  Copyright © 2015 Michal Tynior. All rights reserved.
//

import Foundation

public class DefaultLogMessageFormatter: LogMessageFormatterType {
    
    private let _dateFormatter = NSDateFormatter()
    
    
    public init() {
        _dateFormatter.dateFormat = "yyyy-MM-dd hh:mm::ss.SSS"
    }
    
    public func formatMessage(logMessage: LogMessage) -> String {
        let dateTimeString = _dateFormatter.stringFromDate(logMessage.timestamp)
        
        return "[" + dateTimeString + "][" + logMessage.logLevel.toString() + "] " + logMessage.message
    }
    
}