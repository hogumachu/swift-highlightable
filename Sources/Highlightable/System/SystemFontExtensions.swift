//
//  SystemFontExtensions.swift
//  swift-highlightable
//
//  Created by sungjun.hong on 4/13/25.
//

import SwiftUI

public protocol SystemFontExtensions {
  func apply(_ traits: SystemFontDescriptor.SymbolicTraits...) -> SystemFont
}

extension SystemFont: SystemFontExtensions {
  
  #if os(macOS)
  public func apply(_ traits: SystemFontDescriptor.SymbolicTraits...) -> SystemFont {
    let descriptor = fontDescriptor.withSymbolicTraits(SystemFontDescriptor.SymbolicTraits(traits).union(fontDescriptor.symbolicTraits))
    return SystemFont(
      descriptor: descriptor,
      size: 0
    ) ?? self
  }
  #else
  public func apply(_ traits: SystemFontDescriptor.SymbolicTraits...) -> SystemFont {
    guard let descriptor = fontDescriptor.withSymbolicTraits(SystemFontDescriptor.SymbolicTraits(traits).union(fontDescriptor.symbolicTraits)) else {
      return self
    }
    return SystemFont(
      descriptor: descriptor,
      size: 0
    )
  }
  #endif
  
  
}
