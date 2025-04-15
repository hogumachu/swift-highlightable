//
//  MarkdownStyleable.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/15/25.
//

import Foundation

public protocol MarkdownStyleable: Styleable {
  var codeFont: SystemFont { get }
  var headingTraits: SystemSymbolicTraits { get }
  var boldTraits: SystemSymbolicTraits { get }
  var emphasisTraits: SystemSymbolicTraits { get }
  var boldEmphasisTraits: SystemSymbolicTraits { get }
  var secondaryBackground: SystemColor { get }
  var lighterColor: SystemColor { get }
  var textColor: SystemColor { get }
}
