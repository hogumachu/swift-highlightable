//
//  SystemTextViewCoordinatorDelegate.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/14/25.
//

import Foundation

public struct SystemTextViewCoordinatorDelegate {
  public let textDidBeginEditing: ((_ text: String) -> Void)?
  public let textDidChange: ((_ text: String) -> Void)?
  public let textViewDidChangeSelection: ((_ range: [NSRange]) -> Void)?
  public let textDidEndEditing: ((_ text: String) -> Void)?
  
  public init(
    textDidBeginEditing: ((_ text: String) -> Void)? = nil,
    textDidChange: ((_ text: String) -> Void)? = nil,
    textViewDidChangeSelection: ((_ range: [NSRange]) -> Void)? = nil,
    textDidEndEditing: ((_ text: String) -> Void)? = nil
  ) {
    self.textDidBeginEditing = textDidBeginEditing
    self.textDidChange = textDidChange
    self.textViewDidChangeSelection = textViewDidChangeSelection
    self.textDidEndEditing = textDidEndEditing
  }
  
  public func updating(
    textDidBeginEditing: ((_ text: String) -> Void)? = nil,
    textDidChange: ((_ text: String) -> Void)? = nil,
    textViewDidChangeSelection: ((_ range: [NSRange]) -> Void)? = nil,
    textDidEndEditing: ((_ text: String) -> Void)? = nil
  ) -> Self {
    return .init(
      textDidBeginEditing: self.textDidBeginEditing ?? textDidBeginEditing,
      textDidChange: self.textDidChange ?? textDidChange,
      textViewDidChangeSelection: self.textViewDidChangeSelection ?? textViewDidChangeSelection,
      textDidEndEditing: self.textDidEndEditing ?? textDidEndEditing
    )
  }
}
