//
//  RuleProtocols.swift
//  swift-highlightable
//
//  Created by sungjun.hong on 4/13/25.
//

import Foundation

public protocol AnyRule {
  var regex: NSRegularExpression { get }
}
