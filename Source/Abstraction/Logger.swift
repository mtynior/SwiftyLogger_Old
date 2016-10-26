//
//  Logger.swift
//  SwiftyLogger
//
//  Created by Michal Tynior on 24/10/2016.
//  Copyright © 2016 Michał Tynior. All rights reserved.
//

import Foundation

public protocol Logger {
    
    var loggerFactory: LoggerFactory { get set }
    
    func log(_ message: LogMessage) -> Void
    
}
