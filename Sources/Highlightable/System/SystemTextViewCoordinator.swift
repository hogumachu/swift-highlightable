//
//  SystemTextViewCoordinator.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/14/25.
//

import SwiftUI

public final class SystemTextViewCoordinator: NSObject {
  
  // MARK: - Public
  
  public let delegate: SystemTextViewCoordinatorDelegate
  
  // MARK: - Internal
  
  var textRanges: [NSRange]?
  
  // MARK: - Life Cycle
  
  public init(
    delegate: SystemTextViewCoordinatorDelegate
  ) {
    self.delegate = delegate
  }
}

#if os(macOS)
import AppKit

extension SystemTextViewCoordinator: NSTextViewDelegate {
  
  public func textDidBeginEditing(_ notification: Notification) {
    guard let textView = notification.textView else { return }
    delegate.textDidBeginEditing?(textView.string)
  }
  
  public func textDidChange(_ notification: Notification) {
    guard let textView = notification.textView else { return }
    delegate.textDidChange?(String(textView.textStorage?.string ?? ""))
    textRanges = textView.textRanges
  }
  
  public func textViewDidChangeSelection(_ notification: Notification) {
    guard let textView = notification.textView, let textRanges else { return }
    self.textRanges = textView.textRanges
    delegate.textViewDidChangeSelection?(textRanges)
  }
  
  public func textDidEndEditing(_ notification: Notification) {
    guard let textView = notification.textView else { return }
    delegate.textDidEndEditing?(textView.string)
  }
}

private extension Notification {
  var textView: NSTextView? { object as? NSTextView }
}

private extension NSTextView {
  var textRanges: [NSRange]? { selectedRanges as? [NSRange] }
}
#else
import UIKit

extension SystemTextViewCoordinator: UITextViewDelegate {
  
  public func textViewDidBeginEditing(_ textView: UITextView) {
    delegate.textDidBeginEditing?(textView.text)
  }
  
  public func textViewDidChange(_ textView: UITextView) {
    delegate.textDidChange?(textView.text)
  }
  
  public func textViewDidChangeSelection(_ textView: UITextView) {
    delegate.textViewDidChangeSelection?([textView.selectedRange])
  }
  
  public func textViewDidEndEditing(_ textView: UITextView) {
    delegate.textDidEndEditing?(textView.text)
  }
}

#endif
