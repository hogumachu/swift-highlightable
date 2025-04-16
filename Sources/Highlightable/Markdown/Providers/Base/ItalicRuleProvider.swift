//
//  ItalicRuleProvider.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import Foundation

public struct ItalicRuleProvider: MarkdownRuleProvidable {
  
  // Matches italic text: *italic* or _italic_
  public static let regex = try! NSRegularExpression(
    pattern: #"(\*|_)(.*?)\1"#,
    options: []
  )
  
  public static func rule<T>(with style: T) -> Rule where T: MarkdownStyleable {
    return .init(
      regex: regex,
      textRules: [
        .symbolicTraits(style.boldEmphasisTraits)
      ]
    )
  }
}
