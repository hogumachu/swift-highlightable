//
//  HTMLTagRuleProvider.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import Foundation

public struct HTMLTagRuleProvider: MarkdownRuleProvidable {
  
  // Matches HTML tags: <tagname> or </tagname>
  public static let regex = try! NSRegularExpression(
    pattern: #"</?[a-zA-Z][a-zA-Z0-9\-]*\b[^>]*>"#,
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
