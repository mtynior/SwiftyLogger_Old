//
//  LoggerFactory.swift
//  Logging
//
//  Created by Michal on 12/12/15.
//  Copyright © 2015 Michal Tynior. All rights reserved.
//

import Foundation

public protocol LoggerFactoryType {
    
    var minimumLogLevel: LogLevel { get set }
    
    var messageFormatter: LogMessageFormatterType { get set }
    
    var loggerTargets: [LoggerTargetType] { get set }
    
    func createLogger(loggerName:String) -> LoggerType
    
    func addTarget(target: LoggerTargetType) -> Void

}