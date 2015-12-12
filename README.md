#SwiftyLogger [![Swift 2.0](https://img.shields.io/badge/language-Swift-orange.svg?style=flat)](https://developer.apple.com/swift/) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/mtynior/Felucia/blob/master/LICENSE.md) [![CocoaPods](https://img.shields.io/cocoapods/v/SwiftyLogger.svg)](https://cocoapods.org/pods/Felucia) [![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)


SwiftyLogger is flexible logging abstraction written in Swift.

## Requirements

- iOS 8.0+
- Xcode 7.0+

##Integration

####CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `Felucia` by adding it to your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
	pod 'SwiftyLogger'
end
```
Run `pods install` or `pods update` to intagrate pods with your project.

####Carthage
You can use [Carthage](https://github.com/Carthage/Carthage) to install `SwiftyLogger ` by adding it to your `Cartfile`:

```
github "mtynior/SwiftyLogger"
```

Run `carthage update` to build the framework and drag the built `SwiftyLogger.framework` into your Xcode project.

## Usage

```swift
#import SwiftyLogger

let loggerFactory = LoggerFactory().addCosole().addFile()
let logger = loggerFactory.createLogger("Sample")
       
logger.logDebug("Debug log")
logger.logVerbose("Verbose log")
logger.logInfo("Information log")
logger.logWarning("Warrning log")
logger.logError("Error log")
logger.logCritical("Critical log")
```

### Available log funtions

```swift
logDebug(message: "Debug log")
logDebug(message: "Debug log", file: "Main.swift")
logDebug(message: "Debug log", file: "Main.swift", function: "show()")
logDebug(message: "Debug log", file: "Main.swift", function: "show()", line: 21)
logDebug(message: "Debug log", file: "Main.swift", function: "show()", line: 21, timestamp: NSDate())
```

```swift
logVerbose(message: "Verbose log")
logVerbose(message: "Verbose log", file: "Main.swift")
logVerbose(message: "Verbose log", file: "Main.swift", function: "show()")
logVerbose(message: "Verbose log", file: "Main.swift", function: "show()", line: 21)
logVerbose(message: "Verbose log", file: "Main.swift", function: "show()", line: 21, timestamp: NSDate())
```

```swift
logInfo(message: "Info log")
logInfo(message: "Info log", file: "Main.swift")
logInfo(message: "Info log", file: "Main.swift", function: "show()")
logInfo(message: "Info log", file: "Main.swift", function: "show()", line: 21)
logInfo(message: "Info log", file: "Main.swift", function: "show()", line: 21, timestamp: NSDate())
```

```swift
logWarning(message: "Warrning log")
logWarning(message: "Warrning log", file: "Main.swift")
logWarning(message: "Warrning log", file: "Main.swift", function: "show()")
logWarning(message: "Warrning log", file: "Main.swift", function: "show()", line: 21)
logWarning(message: "Warrning log", file: "Main.swift", function: "show()", line: 21, timestamp: NSDate())
```

```swift
logError(message: "Error log")
logError(message: "Error log", file: "Main.swift")
logError(message: "Error log", file: "Main.swift", function: "show()")
logError(message: "Error log", file: "Main.swift", function: "show()", line: 21)
logError(message: "Error log", file: "Main.swift", function: "show()", line: 21, timestamp: NSDate())
```
```swift
logCritical(message: "Critical log")
logCritical(message: "Critical log", file: "Main.swift")
logCritical(message: "Critical log", file: "Main.swift", function: "show()")
logCritical(message: "Critical log", file: "Main.swift", function: "show()", line: 21)
logCritical(message: "Critical log", file: "Main.swift", function: "show()", line: 21, timestamp: NSDate())
```

### Minimul log level
By default minimum log level is set to `LogLevel.Debug`. You can change it using the `LoggerFactoryType.minimumLogLevel` property: 

```swift
let loggerFactory = LoggerFactory()
loggerFactory.minimumLogLevel = LogLevel.Info
```

## Message formatter
By default `LoggerFactory` has formatter that produces following output:

```
[2015-12-12 20:06:45:45.345][Info] Hello world
```

If you want to change the format of the log message you have to create your own formatter. The only requirement for custom formatter is conformance of the `LogMessageFormatterType` protocol.

Example below show how you can create custom message formatter:

```swift
public class MyLogFormatter: LogMessageFormatterType {
    
    public func formatMessage(logMessage: LogMessage) -> String {
    	return "<" + logMessage.logLevel.toString() + "> " + logMessage.message
    }
    
}
```

Set the formatter in factory:

```swift
let loggerFactory = LoggerFactory()
loggerFactory.messageFormatter = MyLogFormatter()
```

Now `loggerFactory` will produce following output:

```
<Info> Hello world
```

##Default loggers

###Console logger

Default console logger is using `print` function to display log messages.

```swift
let consoleLogger = Console()
let loggerFactory = LoggerFactory().addTarget(consoleLogger)
// or 
let loggerFactory = LoggerFactory().addConsole()
```

###File logger

Default file logger saves log messages in `Documents` folder in `application.log` file.

```swift
let fileLogger = FileLogger()
let loggerFactory = LoggerFactory().addTarget(fileLogger)
// or 
let loggerFactory = LoggerFactory().addFile()
```

You can specify name of the log file:

```swift
let fileLogger = FileLogger("myFile.log")
let loggerFactory = LoggerFactory().addTarget(fileLogger)
// or 
let loggerFactory = LoggerFactory().addFile("myFile.log")
```
By defualt maximum size of log file is 1MB. You can change that using the `FileLogger.maximumFileSizeInBytes` property.

## Custom Loggers
SwiftyLogger is desing to handle custom loggers. The only requirement for custom logger is conformance of the `LoggerTargetType` protocol. 

Example below shows how you can create custom logger:

```swift
public class MyLogger: LoggerTargetType {
   
    public func log(formattedMessage: String, details: LogMessage) {
        print(formattedMessage, separator: "", terminator: "\n")
    }
    
}
```

Thats all. Now you can add your logger to the factory:

```swift
let myLogger = MyLogger()
let loggerFactory = LoggerFactory().addTarget(myLogger)
```

To make things even easier you can extend the `LoggerFactoryType` protocol:

```swift 
public func addMyLogger()  -> LoggerFactoryType {
	self.addTarget(MyLogger())
   	return self
}
```
Now you can add your logger to the factory using fluent API:

```swift
let loggerFactory = LoggerFactory().addMyLogger()
```

##License

SwiftyLogger is released under the MIT license. See LICENSE for details.