//
//  LoggerFactory.swift
//  SwiftyLogger
//
//  Created by Michal Tynior on 24/10/2016.
//  Copyright © 2016 Michał Tynior. All rights reserved.
//

import Foundation

public protocol LoggerFactory {
    
    var minimumLogLevel: LogLevel { get set }
    
    var messageFormatter: LogMessageFormatter { get set }
    
    var loggerTargets: [LoggerTarget] { get set }
    
    func makeLogger() -> Logger
    
    func addTarget(_ target: LoggerTarget) -> Void
    
}
