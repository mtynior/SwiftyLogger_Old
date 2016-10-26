//
//  DefaultLogger.swift
//  SwiftyLogger
//
//  Created by Michal Tynior on 24/10/2016.
//  Copyright © 2016 Michał Tynior. All rights reserved.
//

import Foundation

public class DefaultLogger : Logger {
    
    public var loggerFactory: LoggerFactory
    
    public init(loggerFactory: LoggerFactory) {
        self.loggerFactory = loggerFactory
    }
    
    public func log(_ message: LogMessage) -> Void {
        
        for loggerTarget in loggerFactory.loggerTargets {
            
            let minimumLogLevel = loggerTarget.minimumLogLevel ?? loggerFactory.minimumLogLevel
            
            guard message.logLevel.rawValue >= minimumLogLevel.rawValue else {
                continue
            }
            
            let formatter = loggerTarget.messageFormatter ?? loggerFactory.messageFormatter
            
            let formattedMessage = formatter.format(message: message)
            
            let queue = loggerTarget.queue
            
            if loggerTarget.isAsync {
                queue.async {
                    loggerTarget.log(formattedMessage: formattedMessage)
                }
            } else {
                queue.sync {
                    loggerTarget.log(formattedMessage: formattedMessage)
                }
            }
            
        }
        
    }
    
}
