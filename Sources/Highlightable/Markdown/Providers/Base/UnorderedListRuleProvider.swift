//
//  UnorderedListRuleProvider.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import SwiftUI

public struct UnorderedListRuleProvider: MarkdownRuleProvidable {
  
  // Matches unordered list items: - item, * item, or + item
  public static let regex = try! NSRegularExpression(
    pattern: #"^(\s*)[-*+]\s+.*$"#,
    options: [.anchorsMatchLines]
  )
  
  public static func rule<T>(with style: T) -> Rule where T: MarkdownStyleable {
    return .init(
      regex: regex,
      textRules: [
        // TODO: - Setup styles
        .init(name: .foregroundColor, result: style.lighterColor)
      ]
    )
  }
}
