//
//  Rule+Markdown.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/15/25.
//

import SwiftUI

public extension Array where Element == Rule {
  
  static func markdown<T: MarkdownStyleable>(
    style: T,
    providers: [MarkdownRuleProvidable.Type] = .default
  ) -> [Element] {
    return providers.map { $0.rule(with: style) }
  }
}
