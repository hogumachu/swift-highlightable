//
//  HTMLScriptOrStyleBlockRuleProvider.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import Foundation

public struct HTMLScriptOrStyleBlockRuleProvider: MarkdownRuleProvidable {
  
  // Matches <script> or <style> blocks (potentially multiline)
  public static let regex = try! NSRegularExpression(
    pattern: #"<(script|style)[\s\S]*?>[\s\S]*?</\1>"#,
    options: [.caseInsensitive]
  )
  
  // TODO: - Register text rules
  public static func rule<T>(with style: T) -> Rule where T: MarkdownStyleable {
    return .init(
      regex: regex,
      textRules: []
    )
  }
}
