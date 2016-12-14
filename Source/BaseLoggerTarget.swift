//
//  BaseLoggerTarget.swift
//  SwiftyLogger
//
//  Created by Michal Tynior on 26/10/2016.
//  Copyright © 2016 Future Processing. All rights reserved.
//

import Foundation

open class BaseLoggerTarget: LoggerTarget {
    
    public var minimumLogLevel: LogLevel?
    
    public var messageFormatter: LogMessageFormatter?
    
    public var isAsync: Bool
    
    public var queue: DispatchQueue
    
    
    public init() {
        self.isAsync = true
        
        let uuid = UUID()
        self.queue = DispatchQueue(label:  uuid.uuidString)
    }
    
    public func log(formattedMessage: String) { }

}
