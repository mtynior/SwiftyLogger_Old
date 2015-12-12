//
//  LogMessageFormatter.swift
//  Logging
//
//  Created by Michal on 12/12/15.
//  Copyright © 2015 Michal Tynior. All rights reserved.
//

import Foundation

public protocol LogMessageFormatterType {
    
    func formatMessage(logMessage: LogMessage) -> String;
    
}