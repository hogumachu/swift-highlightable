//
//  DefaultMarkdownProviders.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import Foundation

public extension Array where Element == MarkdownRuleProvidable.Type {
  
  static var `default`: [MarkdownRuleProvidable.Type] {
    return [
      BlockquoteRuleProvider.self,
      BoldItalicRuleProvider.self,
      BoldRuleProvider.self,
      CodeBlockRuleProvider.self,
      HeaderRuleProvider.self,
      InlineCodeRuleProvider.self,
      ItalicRuleProvider.self,
      LinkRuleProvider.self,
      OrderedListRuleProvider.self,
      StrikethroughRuleProvider.self,
      UnorderedListRuleProvider.self,
    ]
  }
  
  @available(*, unavailable, message: "Work in progress")
  static var withHTML: [MarkdownRuleProvidable.Type] {
    return Self.default + [
      HTMLEntityRuleProvider.self,
      HTMLCommentRuleProvider.self,
      HTMLTagRuleProvider.self,
      HTMLScriptOrStyleBlockRuleProvider.self
    ]
  }
}
