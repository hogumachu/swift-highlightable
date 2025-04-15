//
//  MarkdownStyle+Default.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/15/25.
//

import SwiftUI

#if os(macOS)
extension MarkdownStyle {
  static var `default`: MarkdownStyle {
    return .init(
      defaultFont: .systemFont(ofSize: SystemFont.systemFontSize),
      defaultForegroundColor: .labelColor,
      codeFont: .monospacedSystemFont(ofSize: SystemFont.systemFontSize, weight: .thin),
      headingTraits: [.bold, .expanded],
      boldTraits: [.bold],
      emphasisTraits: [.italic],
      boldEmphasisTraits: [.bold, .italic],
      secondaryBackground: .windowBackgroundColor,
      lighterColor: .lightGray,
      textColor: .labelColor
    )
  }
}
#else
extension MarkdownStyle {
  static var `default`: MarkdownStyle {
    return .init(
      defaultFont: .preferredFont(forTextStyle: .body),
      defaultForegroundColor: .label,
      codeFont: .monospacedSystemFont(ofSize: SystemFont.systemFontSize, weight: .thin),
      headingTraits: [.traitBold, .traitExpanded],
      boldTraits: [.traitBold],
      emphasisTraits: [.traitItalic],
      boldEmphasisTraits: [.traitBold, .traitItalic],
      secondaryBackground: .secondarySystemBackground,
      lighterColor: .lightGray,
      textColor: .label
    )
  }
}
#endif
