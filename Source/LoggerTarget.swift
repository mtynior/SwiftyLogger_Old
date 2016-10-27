//
//  LoggerTarget.swift
//  SwiftyLogger
//
//  Created by Michal Tynior on 24/10/2016.
//  Copyright © 2016 Michał Tynior. All rights reserved.
//

import Foundation

public protocol LoggerTarget {
    
    var minimumLogLevel: LogLevel? { get set }
    
    var messageFormatter: LogMessageFormatter? { get set }
    
    var isAsync: Bool { get set }
    
    var queue: DispatchQueue { get set }
    
    
    func log(formattedMessage: String) -> Void
    
}
