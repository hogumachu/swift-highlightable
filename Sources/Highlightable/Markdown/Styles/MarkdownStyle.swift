//
//  MarkdownStyle.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/15/25.
//

import Foundation

public struct MarkdownStyle: MarkdownStyleable {
  
  public let defaultFont: SystemFont
  public let defaultForegroundColor: SystemColor
  public let codeFont: SystemFont
  public let boldTraits: SystemSymbolicTraits
  public let emphasisTraits: SystemSymbolicTraits
  public let boldEmphasisTraits: SystemSymbolicTraits
  public let secondaryBackground: SystemColor
  public let lighterColor: SystemColor
  public let textColor: SystemColor
  public let blockquoteStyle: BlockquoteStyle
  public let headerStyle: HeaderStyle
  public let linkStyle: LinkStyle
  
  public init(
    defaultFont: SystemFont,
    defaultForegroundColor: SystemColor,
    codeFont: SystemFont,
    boldTraits: SystemSymbolicTraits,
    emphasisTraits: SystemSymbolicTraits,
    boldEmphasisTraits: SystemSymbolicTraits,
    secondaryBackground: SystemColor,
    lighterColor: SystemColor,
    textColor: SystemColor,
    blockquoteStyle: BlockquoteStyle,
    headerStyle: HeaderStyle,
    linkStyle: LinkStyle
  ) {
    self.defaultFont = defaultFont
    self.defaultForegroundColor = defaultForegroundColor
    self.codeFont = codeFont
    self.boldTraits = boldTraits
    self.emphasisTraits = emphasisTraits
    self.boldEmphasisTraits = boldEmphasisTraits
    self.secondaryBackground = secondaryBackground
    self.lighterColor = lighterColor
    self.textColor = textColor
    self.blockquoteStyle = blockquoteStyle
    self.headerStyle = headerStyle
    self.linkStyle = linkStyle
  }
}
