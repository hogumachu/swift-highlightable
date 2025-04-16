//
//  macOS+TextHighlighter.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/14/25.
//

#if os(macOS)
import AppKit
import SwiftUI

extension TextHighlighter: NSViewRepresentable {
  
  public typealias NSViewType = ScrollTextView
  
  public func makeCoordinator() -> SystemTextViewCoordinator {
    SystemTextViewCoordinator(delegate: delegate)
  }
  
  public func makeNSView(context: Context) -> ScrollTextView {
    let textView = ScrollTextView()
    textView.delegate = context.coordinator
    return textView
  }
  
  public func updateNSView(_ nsView: ScrollTextView, context: Context) {
    let attributes = nsView.textView.typingAttributes
    nsView.attributedText = execute(text, rules: rules)
    nsView.textView.typingAttributes = attributes
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

// MARK: - TextView

public extension TextHighlighter {
  
  final class ScrollTextView: NSView {
    
    lazy var scrollView: NSScrollView = {
      let scrollView = NSScrollView()
      scrollView.drawsBackground = true
      scrollView.borderType = .noBorder
      scrollView.hasVerticalScroller = true
      scrollView.hasHorizontalScroller = false
      scrollView.autoresizingMask = [.width, .height]
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
    }()
    
    lazy var textView: NSTextView = {
      let contentSize = scrollView.contentSize
      let textStorage = NSTextStorage()
      let layoutManager = NSLayoutManager()
      let textContainer = NSTextContainer(containerSize: scrollView.frame.size)
      
      textStorage.addLayoutManager(layoutManager)
      textContainer.widthTracksTextView = true
      textContainer.containerSize = NSSize(
        width: contentSize.width,
        height: CGFloat.greatestFiniteMagnitude
      )
      layoutManager.addTextContainer(textContainer)
      
      let textView = NSTextView(
        frame: .zero,
        textContainer: textContainer
      )
      textView.autoresizingMask = .width
      textView.backgroundColor = NSColor.textBackgroundColor
      textView.delegate = self.delegate
      textView.drawsBackground = true
      textView.isHorizontallyResizable = false
      textView.isVerticallyResizable = true
      textView.maxSize = NSSize(
        width: CGFloat.greatestFiniteMagnitude,
        height: CGFloat.greatestFiniteMagnitude
      )
      textView.minSize = NSSize(
        width: 0,
        height: contentSize.height
      )
      textView.textColor = NSColor.labelColor
      textView.allowsUndo = true
      return textView
    }()
    
    weak var delegate: NSTextViewDelegate?
    
    var attributedText: NSAttributedString {
      didSet { textView.textStorage?.setAttributedString(attributedText) }
    }
    
    public init() {
      self.attributedText = .init()
      super.init(frame: .zero)
      setupLayouts()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayouts() {
      scrollView.documentView = textView
      addSubview(scrollView)
      NSLayoutConstraint.activate([
        scrollView.topAnchor.constraint(equalTo: topAnchor),
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
      ])
    }
  }
}

#endif
