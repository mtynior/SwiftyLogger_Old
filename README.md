#SwiftyLogger [![Swift 3.2](https://img.shields.io/badge/language-Swift-orange.svg?style=flat)](https://developer.apple.com/swift/) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/mtynior/SwiftyLogger/blob/master/LICENSE.md) [![CocoaPods](https://img.shields.io/cocoapods/v/SwiftyLogger.svg)](https://cocoapods.org/pods/SwiftyLogger) [![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)


SwiftyLogger is flexible logging abstraction written in Swift.

<br />
<br />
<h1 align="center">Project is no longer maintained!</h1>
<br />
<br />

## Requirements

- iOS 9.0+ / Mac OS X 10.10+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 8.0+

## Integration

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `SwiftyLogger` by adding it to your `Podfile`:

```ruby
platform :ios, '9.0'
use_frameworks!

target 'MyApp' do
	pod 'SwiftyLogger'
end
```
Run `pods install` or `pods update` to intagrate pods with your project.

#### Carthage
You can use [Carthage](https://github.com/Carthage/Carthage) to install `SwiftyLogger ` by adding it to your `Cartfile`:

```
github "mtynior/SwiftyLogger"
```

Run `carthage update` to build the framework and drag the built `SwiftyLogger.framework` into your Xcode project.

#### Swift Package Manager (SPM)
You can use The [Swift Package Manager](https://swift.org/package-manager/) to install SwiftyLogger by adding it to your Package.swift file:

```swift
import PackageDescription

let package = Package(
    name: "MyApp",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/mtynior/SwiftyLogger.git",  majorVersion: 2)
    ]
)
```

## Usage

```swift
#import SwiftyLogger

let loggerFactory = DefaultLoggerFactory().addCosole().addFile()
let logger = loggerFactory.makeLogger()
       
logger.logDebug("Debug log")
logger.logVerbose("Verbose log")
logger.logInfo("Information log")
logger.logWarning("Warrning log")
logger.logError("Error log")
logger.logCritical("Critical log")
```

### Available log functions

```swift
logDebug(message: "Debug log")
logDebug(message: "Debug log", file: "Main.swift")
logDebug(message: "Debug log", file: "Main.swift", function: "show()")
logDebug(message: "Debug log", file: "Main.swift", function: "show()", line: 21)
logDebug(message: "Debug log", file: "Main.swift", function: "show()", line: 21, timestamp: NSDate())
logDebug(message: "Debug log", file: "Main.swift", function: "show()", line: 21, timestamp: NSDate(), threadName: "Main")
```

```swift
logVerbose(message: "Verbose log")
logVerbose(message: "Verbose log", file: "Main.swift")
logVerbose(message: "Verbose log", file: "Main.swift", function: "show()")
logVerbose(message: "Verbose log", file: "Main.swift", function: "show()", line: 21)
logVerbose(message: "Verbose log", file: "Main.swift", function: "show()", line: 21, timestamp: NSDate())
logVerbose(message: "Verbose log", file: "Main.swift", function: "show()", line: 21, timestamp: NSDate(), threadName: "Main")
```

```swift
logInfo(message: "Info log")
logInfo(message: "Info log", file: "Main.swift")
logInfo(message: "Info log", file: "Main.swift", function: "show()")
logInfo(message: "Info log", file: "Main.swift", function: "show()", line: 21)
logInfo(message: "Info log", file: "Main.swift", function: "show()", line: 21, timestamp: NSDate())
logInfo(message: "Info log", file: "Main.swift", function: "show()", line: 21, timestamp: NSDate(), threadName: "Main")
```

```swift
logWarning(message: "Warrning log")
logWarning(message: "Warrning log", file: "Main.swift")
logWarning(message: "Warrning log", file: "Main.swift", function: "show()")
logWarning(message: "Warrning log", file: "Main.swift", function: "show()", line: 21)
logWarning(message: "Warrning log", file: "Main.swift", function: "show()", line: 21, timestamp: NSDate())
logWarning(message: "Warrning log", file: "Main.swift", function: "show()", line: 21, timestamp: NSDate(), threadName: "Main")
```

```swift
logError(message: "Error log")
logError(message: "Error log", file: "Main.swift")
logError(message: "Error log", file: "Main.swift", function: "show()")
logError(message: "Error log", file: "Main.swift", function: "show()", line: 21)
logError(message: "Error log", file: "Main.swift", function: "show()", line: 21, timestamp: NSDate())
logError(message: "Error log", file: "Main.swift", function: "show()", line: 21, timestamp: NSDate(), threadName: "Main")
```
```swift
logCritical(message: "Critical log")
logCritical(message: "Critical log", file: "Main.swift")
logCritical(message: "Critical log", file: "Main.swift", function: "show()")
logCritical(message: "Critical log", file: "Main.swift", function: "show()", line: 21)
logCritical(message: "Critical log", file: "Main.swift", function: "show()", line: 21, timestamp: NSDate())
logCritical(message: "Critical log", file: "Main.swift", function: "show()", line: 21, timestamp: NSDate(), threadName: "Main")
```

### Minimul log level
By default minimum log level is set to `LogLevel.debug`. 

If you want to change minimum log level globally for all logger targets, then set the `LoggerFactory.minimumLogLevel` property:

```swift
let loggerFactory = DefaultLoggerFactory()
loggerFactory.minimumLogLevel = LogLevel.info
```

You can change the minimum log level of the specific target using `LoggerTarget.minimumLogLevel`. If the minimum log level for specific logger target is defined, then the global `LoggerFactory.minimumLogLevel` is ignored:

```swift
let consoleLogger = ConsoleLogger()
consoleLogger.minimumLogLevel = .Debug

let fileLogger = FileLogger()
fileLogger.minimumLogLevel = .Error

let loggerFactory = DefaultLoggerFactory().addTarget(consoleLogger).addTarget(fileLogger)
```

### Message formatter
If you want to change message formatter for all logger targets, then set the `LoggerFactory.messageFormatter` property:

```swift
let loggerFactory = DefaultLoggerFactory()
loggerFactory.messageFormatter = ShortMessageFormatter()
```

You can change the message formatter of the specific target using `LoggerTarget.messageFormatter`. If the message formatter for specific logger target is defined, then the global `LoggerFactory.messageFormatter ` is ignored:

```swift
let loggerFactory = DefaultLoggerFactory()
loggerFactory.messageFormatter = LongMessageFormatter() // 

let consoleLogger = ConsoleLogger()
consoleLogger.messageFormatter = ShortMessageFormatter() // console logger is using the ShortMessageFormatter

let fileLogger = FileLogger()  // file logger is using global LongMessageFormatter

loggerFactory.addTarget(consoleLogger).addTarget(fileLogger)
```

### Asynchronous logger targets
Be defalut all logger targets are asynchronous. If you need synchronous target you can use the `LoggerTarget.isAsync` property:

```swift
let consoleLogger = ConsoleLogger()   // console logger is asynchronous by default
consoleLogger.isAsync = false         // now logger is synchronous

```

## Message formatter
By default `LoggerFactory` has formatter that produces following output:

```
[2015-12-12 20:06:45:45.345][Info] Hello world
```

If you want to change the format of the log message you have to create your own formatter. The only requirement for custom formatter is conformance of the `LogMessageFormatter` protocol.

Example below show how you can create custom message formatter:

```swift
public final class MyLogFormatter: LogMessageFormatter {
    
    public func formatMessage(logMessage: LogMessage) -> String {
    	return "<\(logMessage.logLevel)> " + logMessage.message
    }
    
}
```

Set the formatter in factory:

```swift
let loggerFactory = DefaultLoggerFactory()
loggerFactory.messageFormatter = MyLogFormatter()
```

Now `loggerFactory` will produce following output:

```
<Info> Hello world
```

### Console logger

Default console logger is using `print` function to display log messages.

```swift
let consoleLogger = ConsoleLogger()
let loggerFactory = DefaultLoggerFactory().addTarget(consoleLogger)
// or 
let loggerFactory = DefaultLoggerFactory().addConsole()
```

### File logger

By default, the file logger saves log messages in `Caches` folder in `application.log` file.

```swift
let fileLogger = FileLogger()
let loggerFactory = DefaultLoggerFactory().addTarget(fileLogger)
// or 
let loggerFactory = DefaultLoggerFactory().addFile()
```

You can specify name of the log file:

```swift
let fileLogger = FileLogger(fileName: "myFile.log")
let loggerFactory = DefaultLoggerFactory().addTarget(fileLogger)
// or 
let loggerFactory = DefaultLoggerFactory().addFile("myFile.log")
```

You can also specify the explicit path for the log file:

```swift
let url = URL(path: "/path/to/file.log")
let fileLogger = FileLogger(fileURL: url)
let loggerFactory = DefaultLoggerFactory().addTarget(fileLogger)
// or 
let url = URL(path: "/path/to/file.log")
let loggerFactory = DefaultLoggerFactory().addFile(url)
```



By defualt maximum size of log file is 1MB. You can change that using the `FileLogger.maximumFileSizeInBytes` property.

## Custom Loggers
SwiftyLogger is desing to handle custom loggers. The fastest way to create one is to inherit from `BaseLoggerTarget` class:

```swift
public class MyLogger: BaseLoggerTarget {
    
    public override func log(formattedMessage: String) {
        print(formattedMessage, separator: "", terminator: "\n")
    }

}
```

If you dont't like inheritance or you want more control, then you can create logger explicitly by conforming the `LoggerTarget` protocol. 
Example below shows how you can explicitly create custom logger:

```swift
public class MyLogger: LoggerTarget {
    
    public var minimumLogLevel: LogLevel?
    
    public var messageFormatter: LogMessageFormatter?
    
    public var isAsync: Bool
    
    public var queue: DispatchQueue
    
     public init() {
        self.isAsync = true
        
        let uuid = UUID()
        self.queue = DispatchQueue(label:  uuid.uuidString)
    }

    public func log(formattedMessage: String, details: LogMessage) {
        print(formattedMessage, separator: "", terminator: "\n")
    }
    
}
```

Thats all. Now you can add your logger to the factory:

```swift
let myLogger = MyLogger()
let loggerFactory = DefaultLoggerFactory().addTarget(myLogger)
```

To make things even easier you can extend the `LoggerFactory` protocol:

```swift 
public func addMyLogger()  -> LoggerFactory {
	self.addTarget(MyLogger())
   	return self
}
```
Now you can add your logger to the factory using fluent API:

```swift
let loggerFactory = DefaultLoggerFactory().addMyLogger()
```

## License

SwiftyLogger is released under the MIT license. See LICENSE for details.
