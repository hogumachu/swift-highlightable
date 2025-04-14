//
//  iOS+TextHighlighter.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/14/25.
//

#if os (iOS)
import SwiftUI
import UIKit

extension TextHighlighter: UIViewRepresentable {
  
  public typealias UIViewType = UITextView
  
  public func makeCoordinator() -> SystemTextViewCoordinator {
    SystemTextViewCoordinator(delegate: delegate)
  }
  
  public func makeUIView(context: Context) -> UITextView {
    let textView = UITextView()
    textView.delegate = context.coordinator
    return textView
  }
  
  public func updateUIView(_ uiView: UITextView, context: Context) {
    uiView.attributedText = execute(text, rules: rules)
  }
  
  // MARK: - Coordinator Delegate
  
  func textDidBeginEditing(_ text: String) {
    self.text = text
    // TODO: - Add Delegate
  }
  
  func textDidChange(_ text: String) {
    self.text = text
    // TODO: - Add Delegate
  }
  
  func textViewDidChangeSelection(_ range: [NSRange]) {
    // TODO: - Add Delegate
  }
  
  func textDidEndEditing(_ text: String) {
    self.text = text
    // TODO: - Add Delegate
  }
}

#endif
