//
//  MarkdownRuleProvidable.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import Foundation

public protocol MarkdownRuleProvidable {
  static var regex: NSRegularExpression { get }
  static func rule<T: MarkdownStyleable>(with style: T) -> Rule
}
