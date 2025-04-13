//
//  Highlightable.swift
//  swift-highlightable
//
//  Created by sungjun.hong on 4/13/25.
//

import Foundation

public protocol Highlightable {
  var style: Styleable { get set }
  func execute(_ text: String, rules: [Rule]) -> NSMutableAttributedString
}

public extension Highlightable {
  
  func execute(_ text: String, rules: [Rule]) -> NSMutableAttributedString {
    let result = NSMutableAttributedString(string: text)
    let range = NSRange(location: 0, length: text.utf16.count)
    
    result.addAttribute(
      .font,
      value: style.defaultFont,
      range: range
    )
    result.addAttribute(
      .foregroundColor,
      value: style.defaultForegroundColor,
      range: range
    )
    
    rules.forEach { rule in
      let matches = rule.regex.matches(in: text, range: range)
      matches.forEach {
        rule.apply(text, attributedString: result, match: $0)
      }
    }
    
    return result
  }
}
