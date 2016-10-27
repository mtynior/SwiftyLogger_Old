//
//  DefaultLogMessageFormatter.swift
//  SwiftyLogger
//
//  Created by Michal Tynior on 24/10/2016.
//  Copyright © 2016 Michał Tynior. All rights reserved.
//

import Foundation

public final class DefaultLogMessageFormatter: LogMessageFormatter {
    
    private let _dateFormatter = DateFormatter()
    
    
    public init() {
        _dateFormatter.dateFormat = "yyyy-MM-dd hh:mm::ss.SSS"
    }
    
    public func format(message: LogMessage) -> String {
        let dateTimeString = _dateFormatter.string(from: message.timestamp)
        
        return "[" + dateTimeString + "][\(message.logLevel)] " + message.message
    }
    
}
