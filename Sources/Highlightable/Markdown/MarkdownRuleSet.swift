//
//  MarkdownRuleSet.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/15/25.
//

import Foundation

public enum MarkdownRuleSet {
  case inlineCode
  case codeBlock
  case heading
  case linkOrImage
  case linkOrImageTag
  case bold
  case underScoreEmphasis
  case asteriskEmphasis
  case boldEmphasisAsterisk
  case blockquote
  case horizontalRule
  case unorderedList
  case orderedList
  case button
  case strikethrough
  case tag
  case footnote
  case html
}

extension MarkdownRuleSet: AnyRule {
  
  public var regex: NSRegularExpression {
    switch self {
    case .inlineCode:
      return "`[^`]*`".regex
    case .codeBlock:
      return "(`){3}((?!\\1).)+\\1{3}".regex(with: [.dotMatchesLineSeparators])
    case .heading:
      return "^#{1,6}\\s.*$".regex(with: [.anchorsMatchLines])
    case .linkOrImage:
      return "!?\\[([^\\[\\]]*)\\]\\((.*?)\\)".regex
    case .linkOrImageTag:
      return "!?\\[([^\\[\\]]*)\\]\\[(.*?)\\]".regex
    case .bold:
      return "((\\*|_){2})((?!\\1).)+\\1".regex
    case .underScoreEmphasis:
      return "(?<!_)_[^_]+_(?!\\*)".regex
    case .asteriskEmphasis:
      return "(?<!\\*)(\\*)((?!\\1).)+\\1(?!\\*)".regex
    case .boldEmphasisAsterisk:
      return "(\\*){3}((?!\\1).)+\\1{3}".regex
    case .blockquote:
      return "^>.*".regex(with: [.anchorsMatchLines])
    case .horizontalRule:
      return "\n\n(-{3}|\\*{3})\n".regex
    case .unorderedList:
      return "^(\\-|\\*)\\s".regex(with: [.anchorsMatchLines])
    case .orderedList:
      return "^\\d*\\.\\s".regex(with: [.anchorsMatchLines])
    case .button:
      return "<\\s*button[^>]*>(.*?)<\\s*/\\s*button>".regex
    case .strikethrough:
      return "(~)((?!\\1).)+\\1".regex
    case .tag:
      return "^\\[([^\\[\\]]*)\\]:".regex(with: [.anchorsMatchLines])
    case .footnote:
      return "\\[\\^(.*?)\\]".regex
    case .html:
      return "<([A-Z][A-Z0-9]*)\\b[^>]*>(.*?)</\\1>".regex(with: [.dotMatchesLineSeparators, .caseInsensitive])
    }
  }
}

private extension String {
  
  var regex: NSRegularExpression {
    try! NSRegularExpression(pattern: self)
  }
  
  func regex(with options: NSRegularExpression.Options) -> NSRegularExpression {
    return try! NSRegularExpression(pattern: self, options: options)
  }
}

// wip
enum MarkdownRegex {
  static let heading = try! NSRegularExpression(
    pattern: #"^#{1,6}\s.+$"#,
    options: [.anchorsMatchLines]
  )
  
  static let unorderedList = try! NSRegularExpression(
    pattern: #"^(\s*)[-+*]\s+.+$"#,
    options: [.anchorsMatchLines]
  )
  
  static let orderedList = try! NSRegularExpression(
    pattern: #"^(\s*)\d+\.\s+.+$"#,
    options: [.anchorsMatchLines]
  )
  
  static let blockquote = try! NSRegularExpression(
    pattern: #"^>\s?.+$"#,
    options: [.anchorsMatchLines]
  )
  
  static let fencedCodeBlockStart = try! NSRegularExpression(
    pattern: #"^```(\w+)?$"#,
    options: [.anchorsMatchLines]
  )
  
  static let fencedCodeBlockEnd = try! NSRegularExpression(
    pattern: #"^```$"#,
    options: [.anchorsMatchLines]
  )
  
  static let inlineCode = try! NSRegularExpression(
    pattern: #"`[^`\n]+`"#,
    options: []
  )
  
  static let bold = try! NSRegularExpression(
    pattern: #"(\*\*|__)(?=\S)(.+?[*_]*)(?<=\S)\1"#,
    options: []
  )
  
  static let italic = try! NSRegularExpression(
    pattern: #"(\*|_)(?=\S)(.+?)(?<=\S)\1"#,
    options: []
  )
  
  static let boldItalic = try! NSRegularExpression(
    pattern: #"(\*\*\*|___)(?=\S)(.+?)(?<=\S)\1"#,
    options: []
  )
  
  static let strikethrough = try! NSRegularExpression(
    pattern: #"~~(?=\S)(.+?)(?<=\S)~~"#,
    options: []
  )
  
  static let link = try! NSRegularExpression(
    pattern: #"\[([^\]]+)\]\(([^)]+)\)"#,
    options: []
  )
  
  static let image = try! NSRegularExpression(
    pattern: #"!\[([^\]]*)\]\(([^)]+)\)"#,
    options: []
  )
  
  static let horizontalRule = try! NSRegularExpression(
    pattern: #"^(\*\s?){3,}$|^(-\s?){3,}$|^(_\s?){3,}$"#,
    options: [.anchorsMatchLines]
  )
}
