//
//  HTMLCommentRuleProvider.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import Foundation

public struct HTMLCommentRuleProvider: MarkdownRuleProvidable {
  
  // Matches HTML comments <!-- comment -->
  public static let regex = try! NSRegularExpression(
    pattern: #"<!--[\s\S]*?-->"#,
    options: []
  )
  
  // TODO: - Register text rules
  public static func rule<T>(with style: T) -> Rule where T: MarkdownStyleable {
    return .init(
      regex: regex,
      textRules: []
    )
  }
}
