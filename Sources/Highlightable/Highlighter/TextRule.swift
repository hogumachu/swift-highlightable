//
//  TextRule.swift
//  swift-highlightable
//
//  Created by sungjun.hong on 4/13/25.
//

import Foundation

public typealias TextRuleName = NSAttributedString.Key
public typealias TextRuleResult = Any
public typealias TextRuleAction = (
  String, Range<String.Index>
) -> TextRuleResult

public enum TextRule {
  case `default`(name: TextRuleName, action: TextRuleAction)
  case symbolicTraits(SystemSymbolicTraits)
}
