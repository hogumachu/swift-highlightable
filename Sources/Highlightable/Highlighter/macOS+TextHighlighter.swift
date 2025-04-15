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
    
    public let scrollView = NSScrollView()
    public let textView = NSTextView()
    
    weak var delegate: NSTextViewDelegate?
    
    var attributedText: NSAttributedString {
      didSet { textView.textStorage?.setAttributedString(attributedText) }
    }
    
    public init() {
      self.attributedText = .init()
      super.init(frame: .zero)
      setupViews()
      setupLayouts()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayouts() {
      addSubview(scrollView)
      NSLayoutConstraint.activate([
        scrollView.topAnchor.constraint(equalTo: topAnchor),
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
      ])
    }
    
    private func setupViews() {
      scrollView.drawsBackground = true
      scrollView.borderType = .noBorder
      scrollView.hasVerticalScroller = true
      scrollView.hasHorizontalScroller = false
      scrollView.autoresizingMask = [.width, .height]
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      
      textView.textContainer = makeTextContainer()
      textView.autoresizingMask = .width
      textView.backgroundColor = NSColor.textBackgroundColor
      textView.delegate = self.delegate
      textView.drawsBackground = true
      textView.isHorizontallyResizable = false
      textView.isVerticallyResizable = true
      textView.maxSize = NSSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
      textView.minSize = NSSize(width: 0, height: scrollView.contentSize.height)
      textView.textColor = NSColor.labelColor
      textView.allowsUndo = true
      
      scrollView.documentView = textView
    }
    
    private func makeTextContainer() -> NSTextContainer {
      let contentSize = scrollView.contentSize
      let textStorage = NSTextStorage()
      let layoutManager = NSLayoutManager()
      textStorage.addLayoutManager(layoutManager)
      let textContainer = NSTextContainer(containerSize: scrollView.frame.size)
      textContainer.widthTracksTextView = true
      textContainer.containerSize = NSSize(
        width: contentSize.width,
        height: CGFloat.greatestFiniteMagnitude
      )
      layoutManager.addTextContainer(textContainer)
      return textContainer
    }
  }
}

#endif
