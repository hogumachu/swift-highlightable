//
//  InlineCodeRuleProvider.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import Foundation

public struct InlineCodeRuleProvider: MarkdownRuleProvidable {
  
  // Matches inline code: `code`
  public static let regex = try! NSRegularExpression(
    pattern: #"`([^`\n]+)`"#,
    options: []
  )
  
  public static func rule<T>(with style: T) -> Rule where T: MarkdownStyleable {
    return .init(
      regex: regex,
      textRules: [
        .init(name: .font, result: style.codeFont)
      ]
    )
  }
}
