//
//  Logger.swift
//  Logging
//
//  Created by Michal on 12/12/15.
//  Copyright © 2015 Michal Tynior. All rights reserved.
//

import Foundation

public class Logger : LoggerType {
    
    public var loggerFactory: LoggerFactoryType
    
    public init(_ loggerFactory: LoggerFactoryType) {
        self.loggerFactory = loggerFactory
    }
    
    public func log(logMessage: LogMessage) -> Void {
        if( logMessage.logLevel.rawValue >= loggerFactory.minimumLogLevel.rawValue ) {
            let formattedMessage = loggerFactory.messageFormatter.formatMessage(logMessage)
            
            for target in loggerFactory.loggerTargets {
                target.log(formattedMessage, details: logMessage)
            }
        }
    }
    
}