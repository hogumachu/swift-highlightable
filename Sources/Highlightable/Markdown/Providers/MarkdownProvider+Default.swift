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
      HeaderRuleProvider.self,
      StrikethroughRuleProvider.self,
      BoldRuleProvider.self,
      ItalicRuleProvider.self,
      BoldItalicRuleProvider.self,
      InlineCodeRuleProvider.self,
      CodeBlockRuleProvider.self,
      LinkRuleProvider.self,
      BlockquoteRuleProvider.self,
      UnorderedListRuleProvider.self,
      OrderedListRuleProvider.self
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
