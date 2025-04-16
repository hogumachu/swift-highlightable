//
//  HeaderStyle.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import Foundation

public struct HeaderStyle {
  public let traits: SystemSymbolicTraits
  public let kern: NSNumber
  public let baseFontSize: CGFloat
  public let fontSizeMultiplier: CGFloat
  
  public init(
    traits: SystemSymbolicTraits,
    kern: NSNumber,
    baseFontSize: CGFloat,
    fontSizeMultiplier: CGFloat
  ) {
    self.traits = traits
    self.kern = kern
    self.baseFontSize = baseFontSize
    self.fontSizeMultiplier = fontSizeMultiplier
  }
}
