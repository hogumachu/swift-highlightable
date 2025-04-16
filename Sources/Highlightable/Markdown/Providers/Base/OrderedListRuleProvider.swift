//
//  OrderedListRuleProvider.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import SwiftUI

public struct OrderedListRuleProvider: MarkdownRuleProvidable {
  
  // Matches ordered list items: 1. item, 2. item, etc.
  public static let regex = try! NSRegularExpression(
    pattern: #"^\s*\d+\.\s+.*$"#,
    options: [.anchorsMatchLines]
  )
  
  public static func rule<T>(with style: T) -> Rule where T: MarkdownStyleable {
    return .init(
      regex: regex,
      textRules: [
        // TODO: - Setup styles
        .foregroundColor(style.lighterColor)
      ]
    )
  }
}
