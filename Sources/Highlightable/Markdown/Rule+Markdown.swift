//
//  Rule+Markdown.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/15/25.
//

import SwiftUI

public extension Array where Element == Rule {
  
  static func markdown<T: MarkdownStyleable>(style: T) -> [Element] {
    return [
      .init(.inlineCode, textRule: .init(name: .font, result: style.codeFont)),
      .init(.codeBlock, textRule: .init(name: .font, result: style.codeFont)),
      .init(.heading, textRules: [
        .symbolicTraits(style.headingTraits),
        .init(name: .kern, result: 0.5),
        .default(name: .font) { content, _ in
          let maxLevel = 6
          let uncappedLevel = content.prefix(while: { char in char == "#" }).count
          let level = Swift.min(maxLevel, uncappedLevel)
          let fontSize = CGFloat(maxLevel - level) * 2.5 + style.defaultFont.pointSize
          return SystemFont(descriptor: style.defaultFont.fontDescriptor, size: fontSize) as TextRuleResult
        }
      ]),
      .init(.linkOrImage, textRule: .init(name: .underlineStyle, result: NSUnderlineStyle.single.rawValue)),
      .init(.linkOrImageTag, textRule: .init(name: .underlineStyle, result: NSUnderlineStyle.single.rawValue)),
      .init(.bold, textRule: .init(name: .underlineStyle, result: style.boldTraits)),
      .init(.boldEmphasisAsterisk, textRule: .init(name: .underlineStyle, result: style.boldEmphasisTraits)),
      .init(.asteriskEmphasis, textRule: .init(name: .underlineStyle, result: style.emphasisTraits)),
      .init(.underScoreEmphasis, textRule: .init(name: .underlineStyle, result: style.emphasisTraits)),
      .init(.blockquote, textRule: .init(name: .underlineStyle, result: style.secondaryBackground)),
      .init(.horizontalRule, textRule: .init(name: .underlineStyle, result: style.lighterColor)),
      .init(.unorderedList, textRule: .init(name: .underlineStyle, result: style.lighterColor)),
      .init(.orderedList, textRule: .init(name: .underlineStyle, result: style.lighterColor)),
      .init(.button, textRule: .init(name: .underlineStyle, result: style.lighterColor)),
      .init(.strikethrough, textRules: [
        .init(name: .strikethroughStyle, result: NSUnderlineStyle.single.rawValue),
        .init(name: .strikethroughColor, result: style.textColor),
      ]),
      .init(.tag, textRule: .init(name: .foregroundColor, result: style.lighterColor)),
      .init(.footnote, textRule: .init(name: .foregroundColor, result: style.lighterColor)),
      .init(.html, textRules: [
        .init(name: .font, result: style.codeFont),
        .init(name: .foregroundColor, result: style.lighterColor),
      ]),
    ]
  }
  
}

private extension Rule {
  
  init(_ markdown: MarkdownRuleSet, textRule: TextRule) {
    self.init(regex: markdown.regex, textRules: [textRule])
  }
  
  init(_ markdown: MarkdownRuleSet, textRules: [TextRule]) {
    self.init(regex: markdown.regex, textRules: textRules)
  }
}
