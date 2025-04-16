//
//  BoldRuleProvider.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import Foundation

public struct BoldRuleProvider: MarkdownRuleProvidable {
  
  // Matches bold text: **bold** or __bold__
  public static let regex = try! NSRegularExpression(
    pattern: #"(\*\*|__)(.*?)\1"#,
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
