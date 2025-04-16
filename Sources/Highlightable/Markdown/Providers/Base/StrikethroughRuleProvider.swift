//
//  StrikethroughRuleProvider.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import SwiftUI

public struct StrikethroughRuleProvider: MarkdownRuleProvidable {
  
  public static let regex = try! NSRegularExpression(
    pattern: #"~~(.*?)~~"#,
    options: []
  )
  
  public static func rule<T>(with style: T) -> Rule where T: MarkdownStyleable {
    return .init(
      regex: regex,
      textRules: [
        .strikethroughStyle(.single),
        .strikethroughColor(style.lighterColor) // TODO: - Add Color Dependency
      ]
    )
  }
}
