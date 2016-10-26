//
//  ConsoleLogger.swift
//  SwiftyLogger
//
//  Created by Michal Tynior on 25/10/2016.
//  Copyright © 2016 Future Processing. All rights reserved.
//

import Foundation

public class ConsoleLogger: BaseLoggerTarget {
    
    public override func log(formattedMessage: String) {
        print(formattedMessage, separator: "", terminator: "\n")
    }

}

// MARK: - LoggerFactory extension

public extension LoggerFactory {
    
    public func addCosole()  -> LoggerFactory {
        self.addTarget(ConsoleLogger())
        return self
    }
    
}
