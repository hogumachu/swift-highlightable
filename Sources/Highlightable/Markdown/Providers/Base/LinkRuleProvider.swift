//
//  LinkRuleProvider.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import SwiftUI

public struct LinkRuleProvider: MarkdownRuleProvidable {
  
  // Matches Markdown links: [text](url)
  public static let regex = try! NSRegularExpression(
    pattern: #"\[([^\]]+)\]\(([^)]+)\)"#,
    options: []
  )
  
  public static func rule<T>(with style: T) -> Rule where T: MarkdownStyleable {
    return .init(
      regex: regex,
      textRules: [
        .init(name: .underlineStyle, result: NSUnderlineStyle.single.rawValue),
        .init(name: .foregroundColor, result: style.lighterColor), // TODO: - Add Color Dependency
      ]
    )
  }
}
