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
  
  public func apply(_ traits: SystemFontDescriptor.SymbolicTraits...) -> SystemFont {
#if os(macOS)
    let descriptor = fontDescriptor.withSymbolicTraits(SystemFontDescriptor.SymbolicTraits(traits).union(fontDescriptor.symbolicTraits))
    return SystemFont(
      descriptor: descriptor,
      size: 0
    ) ?? self
#else
    guard let descriptor = fontDescriptor.withSymbolicTraits(SystemFontDescriptor.SymbolicTraits(traits).union(fontDescriptor.symbolicTraits)) else {
      return self
    }
    return SystemFont(
      descriptor: descriptor,
      size: 0
    )
#endif
  }
}
