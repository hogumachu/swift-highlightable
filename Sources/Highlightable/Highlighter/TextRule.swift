//
//  TextRule.swift
//  swift-highlightable
//
//  Created by sungjun.hong on 4/13/25.
//

import Foundation

public typealias TextRuleName = NSAttributedString.Key
public typealias TextRuleResult = Any
public typealias TextRuleContent = String
public typealias TextRuleRange = Range<TextRuleContent.Index>
public typealias TextRuleAction = (
  TextRuleContent, Range<String.Index>
) -> TextRuleResult

public enum TextRule {
  case `default`(name: TextRuleName, action: TextRuleAction)
  case symbolicTraits(SystemSymbolicTraits)
}

extension TextRule {
  
  func applyIfEnabled(
    _ text: NSMutableAttributedString,
    content: TextRuleContent,
    contentRange: TextRuleRange,
    range: NSRange
  ) {
    if case .default(let name, let action) = self {
      text.addAttribute(
        name,
        value: action(content, contentRange),
        range: range
      )
    }
  }
  
  func applySymbolicTraitsIfEnabled(
    _ text: NSMutableAttributedString,
    previousFont: SystemFont,
    range: NSRange
  ) {
    if case .symbolicTraits(let traits) = self {
      text.addAttribute(.font, value: previousFont.apply(traits), range: range)
    }
  }
}
