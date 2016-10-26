//
//  FileLogger.swift
//  SwiftyLogger
//
//  Created by Michal Tynior on 25/10/2016.
//  Copyright © 2016 Future Processing. All rights reserved.
//

import Foundation

public class FileLogger: BaseLoggerTarget {
    
    public var logFileURL: URL?
    
    public static let defultFileName = "application.log"
    
    public var fileName: String = ""
    
    public var maximumFileSizeInBytes: Int64 = 10_485_760 // 10MB

    fileprivate var _logFile: FileHandle?
    
    
    public init(fileURL: URL) {
        super.init()
        
        let filePath = fileURL.path
        
        if( !FileManager.default.fileExists(atPath: filePath) ) {
            FileLogger.createLogFile(atPath: filePath)
        }
        else {
            let fileSizeInBytes = FileLogger.getSizeInBytesOfLogFile(atPath: filePath)
            
            if( fileSizeInBytes  >= maximumFileSizeInBytes ) {
                FileLogger.recreateLogFile(atPath: filePath)
            }
        }
        
        _logFile = FileHandle(forWritingAtPath: filePath)!
        _logFile!.seekToEndOfFile()
    }
    
    public convenience init(fileName: String = defultFileName) {
        let fileUrl = FileLogger.getDefaultPathForFile(named: fileName)
        self.init(fileURL: fileUrl)
    }
    
    deinit {
        _logFile!.closeFile()
    }
    
    
    public override func log(formattedMessage: String) {
        let data = (formattedMessage + "\n").data(using: String.Encoding.utf8)
        _logFile!.write(data!)
        _logFile!.synchronizeFile()
    }
    
}

// MARK: - Helpers

extension FileLogger {
    
    fileprivate static func getDefaultPathForFile(named fileName: String, fileManager: FileManager =  FileManager.default) -> URL {
        
        var baseURL: URL?
        
        #if os(OSX)
            baseURL =  fileManager.urls(for:.cachesDirectory, in: .userDomainMask).first
        #else
            #if os(Linux)
                baseURL = URL(fileURLWithPath: "/var/cache")
            #else
                // iOS, watchOS, etc. are using the caches directory
                baseURL =  fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first
            #endif
        #endif
        
        guard let directoryURL = baseURL else {
            return URL(string: "")!
        }
        
        return  directoryURL.appendingPathComponent(fileName, isDirectory: false)
        
    }
    
    fileprivate static func createLogFile(atPath path:String, fileManager: FileManager =  FileManager.default) {
        fileManager.createFile(atPath: path, contents: nil, attributes: nil)
    }
    
    fileprivate static func getSizeInBytesOfLogFile(atPath path:String, fileManager: FileManager = FileManager.default) -> Int64 {
        let fileAttributes: [FileAttributeKey : Any] =  try! fileManager.attributesOfItem(atPath: path)
        return (fileAttributes[FileAttributeKey.size] as! NSNumber ).int64Value
    }
    
    fileprivate static func recreateLogFile(atPath path: String, fileManager: FileManager = FileManager.default) {
        try! fileManager.removeItem(atPath: path)
        fileManager.createFile(atPath: path, contents: nil, attributes: nil)
    }
    
}


// MARK: - LoggerFactory extension

public extension LoggerFactory {
    
    public func addFile(fileName: String = FileLogger.defultFileName)  -> LoggerFactory {
        self.addTarget(FileLogger(fileName: fileName))
        return self
    }
    
    public func addFile(fileURL: URL)  -> LoggerFactory {
        self.addTarget(FileLogger(fileURL: fileURL))
        return self
    }
    
}
