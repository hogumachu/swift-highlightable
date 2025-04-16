//
//  HeaderRuleProvider.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import Foundation

public struct HeaderRuleProvider: MarkdownRuleProvidable {
  
  // Matches Markdown headers (# Header 1 to ###### Header 6)
  public static let regex = try! NSRegularExpression(
    pattern: #"^#{1,6}\s.*$"#,
    options: [.anchorsMatchLines]
  )
  
  public static func rule<T>(with style: T) -> Rule where T: MarkdownStyleable {
    return .init(
      regex: regex,
      textRules: [
        .symbolicTraits(style.headerStyle.traits),
        .kern(style.headerStyle.kern),
        .font { content, _ in
          let maxLevel = 6
          let uncappedLevel = content.prefix(while: { char in char == "#" }).count
          let level = Swift.min(maxLevel, uncappedLevel)
          let fontSize = CGFloat(maxLevel - level) * style.headerStyle.fontSizeMultiplier + style.headerStyle.baseFontSize
          return SystemFont(descriptor: style.defaultFont.fontDescriptor, size: fontSize) as TextRuleResult
        }
      ]
    )
  }
}
