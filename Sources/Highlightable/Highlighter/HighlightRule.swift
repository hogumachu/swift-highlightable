//
//  HighlightRule.swift
//  swift-highlightable
//
//  Created by sungjun.hong on 4/13/25.
//

import Foundation

public struct Rule: AnyRule {
  public let regex: NSRegularExpression
  public let textRules: [TextRule]
  
  public init(
    regex: NSRegularExpression,
    textRules: [TextRule]
  ) {
    self.regex = regex
    self.textRules = textRules
  }
}
