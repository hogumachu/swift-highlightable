//
//  BlockquoteRuleProvider.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import SwiftUI

public struct BlockquoteRuleProvider: MarkdownRuleProvidable {
  
  // Matches blockquotes: > Quote
  public static let regex = try! NSRegularExpression(
    pattern: #"^>\s.*$"#,
    options: [.anchorsMatchLines]
  )
  
  public static func rule<T>(with style: T) -> Rule where T: MarkdownStyleable {
    return .init(
      regex: regex,
      textRules: [
        .init(name: .backgroundColor, result: style.secondaryBackground)
      ]
    )
  }
}
