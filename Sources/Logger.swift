//
//  Logger.swift
//  GitHubMoyaMoya
//
//  Created by Jason on 2022/02/07.
//

import Foundation

internal let logger = Logger()

internal final class Logger {
  
  internal func error(
    _ items: Any...,
    file: StaticString = #file,
    internal function: StaticString = #function,
    line: UInt = #line
  ) {
    let prefix = self.logPrefix(file: file, function: function, line: line)
    let message = self.message(from: items)
    NSLog("%@ %@%@", "❤️ ERROR", prefix, message)
    
  }
  
  internal func warning(
    _ items: Any...,
    file: StaticString = #file,
    function: StaticString = #function,
    line: UInt = #line
  ) {
    let prefix = self.logPrefix(file: file, function: function, line: line)
    let message = self.message(from: items)
    NSLog("%@ %@%@", "💛 WARNING", prefix, message)
  }
  
  internal func info(
    _ items: Any...,
    file: StaticString = #file,
    function: StaticString = #function,
    line: UInt = #line
  ) {
    let prefix = self.logPrefix(file: file, function: function, line: line)
    let message = self.message(from: items)
    NSLog("%@ %@%@", "💙 INFO", prefix, message)
  }
  
  internal func debug(
    _ items: Any...,
    file: StaticString = #file,
    function: StaticString = #function,
    line: UInt = #line
  ) {
    let prefix = self.logPrefix(file: file, function: function, line: line)
    let message = self.message(from: items)
    NSLog("%@ %@%@", "💚 DEBUG", prefix, message)
    
  }
  
  internal func verbose(
    _ items: Any...,
    file: StaticString = #file,
    function: StaticString = #function,
    line: UInt = #line
  ) {
    let prefix = self.logPrefix(file: file, function: function, line: line)
    let message = self.message(from: items)
    NSLog("%@ %@%@", "💜 VERBOSE", prefix, message)
    
  }
  
  
  // MARK: Utils
  private func message(from items: [Any]) -> String {
    return items
      .map { String(describing: $0) }
      .joined(separator: " ")
  }
  
  private func logPrefix(file: StaticString, function: StaticString, line: UInt) -> String {
    let filename = URL(string:"\(file)")!.lastPathComponent
    var components = filename.components(separatedBy: ".")
    guard components.count > 1 else { return filename }
    components.removeLast()
    
    let className = components.joined(separator: ".")
    let functionName = "\(function)"
    
    return "\(className).\(functionName):\(line) - "
  }
  
}
