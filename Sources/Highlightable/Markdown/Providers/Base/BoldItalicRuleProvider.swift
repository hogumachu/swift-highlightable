//
//  BoldItalicRuleProvider.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import Foundation

public struct BoldItalicRuleProvider: MarkdownRuleProvidable {
  
  // Matches bold + italic text: ***bolditalic*** or ___bolditalic___
  public static let regex = try! NSRegularExpression(
    pattern: #"(\*\*\*|___)(.*?)\1"#,
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
