//
//  TextHighlighter.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/14/25.
//

import SwiftUI

public struct TextHighlighter<T: Styleable>: Highlightable {
  
  // MARK: - Public
  
  @Binding public var text: String
  public let style: T
  
  // MARK: - Internal
  
  let rules: [Rule]
  
  var delegate: SystemTextViewCoordinatorDelegate {
    .init(
      textDidBeginEditing: { textDidBeginEditing($0) },
      textDidChange: { textDidChange($0) },
      textViewDidChangeSelection: { textViewDidChangeSelection($0) },
      textDidEndEditing: { textDidEndEditing($0) }
    )
  }
  
  // MARK: - Life Cycle
  
  public init(
    text: Binding<String>,
    style: T,
    rules: [Rule]
  ) {
    self._text = text
    self.style = style
    self.rules = rules
  }
}
