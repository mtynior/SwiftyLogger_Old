//
//  FileLogger.swift
//  Logging
//
//  Created by Michal on 12/12/15.
//  Copyright © 2015 Future Processing. All rights reserved.
//

import Foundation

public class FileLogger: LoggerTargetType {
    
    public static let defultFileName = "application.log"
    
    public var fileName: String
    
    public var maximumFileSizeInBytes: Int64 = 1_048_576 // 1MB
    
    private var _logFile: NSFileHandle? = nil
    
    
    public init(_ fileName: String = defultFileName) {
        self.fileName = fileName
        let fileManager = NSFileManager.defaultManager()
        let filePath = getFilePath()
        
        if( !fileManager.fileExistsAtPath(filePath) ) {
            createLogFileAtPath(filePath, fileManager: fileManager)
        }
        else {
            let fileSizeInBytes = getSizeInBytesOfLogFileAtPath(filePath, fileManager: fileManager)
            
            if( fileSizeInBytes  >= maximumFileSizeInBytes ) {
                recreateLogFileAtPath(filePath, fileManager: fileManager)
            }
        }
        
        _logFile = NSFileHandle(forWritingAtPath: filePath)!
        _logFile!.seekToEndOfFile()
    }
    
    deinit {
        _logFile!.closeFile()
    }
    
    public func log(formattedMessage: String, details: LogMessage) {
        let data = (formattedMessage + "\n").dataUsingEncoding(NSUTF8StringEncoding)
        _logFile!.writeData(data!)
        _logFile!.synchronizeFile()
    }

}

// MARK: - Helpers

extension FileLogger {
    
    private func getFilePath() -> String {
        let paths:Array = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let ducumentsDirectory: NSString = paths.first!
        return ducumentsDirectory.stringByAppendingPathComponent(fileName)
    }
    
    private func createLogFileAtPath(path:String, fileManager: NSFileManager) {
        fileManager.createFileAtPath(path, contents: nil, attributes: nil)
    }
    
    private func getSizeInBytesOfLogFileAtPath(path:String, fileManager: NSFileManager) -> Int64 {
        let fileAttributes: [String : AnyObject?] =  try! fileManager.attributesOfItemAtPath(path)
        return (fileAttributes[NSFileSize] as! NSNumber ).longLongValue
    }
    
    private func recreateLogFileAtPath(path: String, fileManager: NSFileManager) {
        try! fileManager.removeItemAtPath(path)
        fileManager.createFileAtPath(path, contents: nil, attributes: nil)
    }
    
}


// MARK: - LoggerFactoryType extension

public extension LoggerFactoryType {
    
    public func addFile(fileName: String = FileLogger.defultFileName)  -> LoggerFactoryType {
        self.addTarget(FileLogger(fileName))
        return self
    }
    
}