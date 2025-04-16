//
//  BlockquoteStyle.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import Foundation

public struct BlockquoteStyle {
  public let foregroundColor: SystemColor
  public let font: SystemFont
  public let traits: SystemSymbolicTraits
  
  public init(
    foregroundColor: SystemColor,
    font: SystemFont,
    traits: SystemSymbolicTraits
  ) {
    self.foregroundColor = foregroundColor
    self.font = font
    self.traits = traits
  }
}
