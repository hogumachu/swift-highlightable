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
      boldTraits: [.bold],
      emphasisTraits: [.italic],
      boldEmphasisTraits: [.bold, .italic],
      secondaryBackground: .windowBackgroundColor,
      lighterColor: .lightGray,
      textColor: .labelColor,
      blockquoteStyle: .init(
        foregroundColor: .lightGray,
        font: .systemFont(ofSize: SystemFont.smallSystemFontSize),
        traits: [.italic]
      ),
      headerStyle: .init(
        traits: [.bold, .expanded],
        kern: 0.5,
        baseFontSize: SystemFont.systemFontSize,
        fontSizeMultiplier: 2.5
      ),
      linkStyle: .init(
        foregroundColor: .blue
      )
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
      boldTraits: [.traitBold],
      emphasisTraits: [.traitItalic],
      boldEmphasisTraits: [.traitBold, .traitItalic],
      secondaryBackground: .secondarySystemBackground,
      lighterColor: .lightGray,
      textColor: .label,
      blockquoteStyle: .init(
        foregroundColor: .lightGray,
        font: .preferredFont(forTextStyle: .callout),
        traits: [.traitItalic]
      ),
      headerStyle: .init(
        traits: [.traitBold, .traitExpanded],
        kern: 0.5,
        baseFontSize: SystemFont.systemFontSize,
        fontSizeMultiplier: 2.5
      ),
      linkStyle: .init(
        foregroundColor: .blue
      )
    )
  }
}
#endif
