//
//  Logger.swift
//  Logging
//
//  Created by Michal on 12/12/15.
//  Copyright © 2015 Michal Tynior. All rights reserved.
//

import Foundation

public protocol LoggerType {
    
    var loggerFactory: LoggerFactoryType { get set }

    func log(logMessage: LogMessage) -> Void
    
}