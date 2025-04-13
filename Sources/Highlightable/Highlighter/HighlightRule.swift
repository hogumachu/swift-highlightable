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

public extension Rule {
  
  func apply(
    _ origin: String,
    attributedString: NSMutableAttributedString,
    match: NSTextCheckingResult
  ) {
    textRules.forEach { textRule in
      attributedString.enumerateAttributes(in: match.range) { attributes, _, _ in
        if let previousFont = attributes.first(where: { $0.key == .font })?.value as? SystemFont {
          textRule.applySymbolicTraitsIfEnabled(attributedString, previousFont: previousFont, range: match.range)
        }
      }
      
      let contentRange = Range(match.range, in: origin)!
      let content = String(origin[contentRange])
      textRule.applyIfEnabled(
        attributedString,
        content: content,
        contentRange: contentRange,
        range: match.range
      )
    }
  }
}
