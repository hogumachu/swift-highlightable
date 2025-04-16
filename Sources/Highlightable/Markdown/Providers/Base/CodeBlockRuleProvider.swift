//
//  CodeBlockRuleProvider.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import Foundation

public struct CodeBlockRuleProvider: MarkdownRuleProvidable {
  
  // Matches code blocks: ```code```
  public static let regex = try! NSRegularExpression(
    pattern: #"```[\s\S]*?```"#,
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
