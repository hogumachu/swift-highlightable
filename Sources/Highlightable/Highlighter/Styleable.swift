//
//  Styleable.swift
//  swift-highlightable
//
//  Created by sungjun.hong on 4/13/25.
//

import Foundation

public protocol Styleable {
  var defaultFont: SystemFont { get }
  var defaultForegroundColor: SystemColor { get }
}
