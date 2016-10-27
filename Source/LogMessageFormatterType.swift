//
//  LogMessageFormatter.swift
//  SwiftyLogger
//
//  Created by Michal Tynior on 24/10/2016.
//  Copyright © 2016 Michał Tynior. All rights reserved.
//

import Foundation

public protocol LogMessageFormatter {
    
    func format(message: LogMessage) -> String;
    
}
