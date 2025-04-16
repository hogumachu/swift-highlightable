//
//  TextRule+Init.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import SwiftUI

extension TextRule {
  
  // MARK: - Private
  
  private init(name: TextRuleName, result: TextRuleResult) {
    self = .default(
      name: name,
      action: { _, _ in result }
    )
  }
  
  // MARK: - Font
  
  static func font(action: @escaping TextRuleAction) -> Self {
    return .default(name: .font, action: action)
  }
  
  static func font(_ font: SystemFont) -> Self {
    return .init(name: .font, result: font)
  }
  
  // MARK: - Color
  
  static func foregroundColor(_ color: SystemColor) -> Self {
    return .init(name: .foregroundColor, result: color)
  }
  
  static func backgroundColor(_ color: SystemColor) -> Self {
    return .init(name: .backgroundColor, result: color)
  }
  
  static func strikethroughColor(_ color: SystemColor) -> Self {
    return .init(name: .strikethroughColor, result: color)
  }
  
  // MARK: - Line Style
  
  static func underlineStyle(_ style: NSUnderlineStyle) -> Self {
    return .init(name: .underlineColor, result: style.rawValue)
  }
  
  static func strikethroughStyle(_ style: NSUnderlineStyle) -> Self {
    return .init(name: .strikethroughStyle, result: style.rawValue)
  }
  
  // MARK: - Etc
  
  static func kern(_ value: NSNumber) -> Self {
    return .init(name: .kern, result: value)
  }
}
