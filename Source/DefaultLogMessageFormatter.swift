//
//  DefaultLogMessageFormatter.swift
//  SwiftyLogger
//
//  Created by Michal Tynior on 24/10/2016.
//  Copyright © 2016 Michał Tynior. All rights reserved.
//

import Foundation

public final class DefaultLogMessageFormatter: LogMessageFormatter {
    
    private lazy var _dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        return formatter
    }()
    
    public init() { }
    
    public func format(message: LogMessage) -> String {
        let dateTimeString = _dateFormatter.string(from: message.timestamp)
        
        return "[" + dateTimeString + "][\(message.logLevel)] " + message.message
    }
    
}
