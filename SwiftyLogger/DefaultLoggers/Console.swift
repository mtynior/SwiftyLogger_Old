//
//  ConsoleTarget.swift
//  Logging
//
//  Created by Michal on 12/12/15.
//  Copyright © 2015 Michal Tynior. All rights reserved.
//

import Foundation

public class Console: LoggerTargetType {
    
    public init() { }
    
    public func log(formattedMessage: String, details: LogMessage) {
        print(formattedMessage, separator: "", terminator: "\n")
    }
    
}

// MARK: - LoggerFactoryType extension

public extension LoggerFactoryType {
    
    public func addCosole()  -> LoggerFactoryType {
        self.addTarget(Console())
        return self
    }
    
}