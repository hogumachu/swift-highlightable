//
//  MarkdownHighlighter.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/15/25.
//

import SwiftUI

public typealias MarkdownHighlighter<T: MarkdownStyleable> = TextHighlighter<T>

extension MarkdownHighlighter where T == MarkdownStyle {
  
  public init(text: Binding<String>) {
    let style = MarkdownStyle.default
    self = .init(
      text: text,
      style: style,
      rules: .markdown(style: style)
    )
  }
}
