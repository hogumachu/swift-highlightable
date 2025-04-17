//
//  LinkRuleProvider.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import SwiftUI

struct MarkdownLink {
  let text: String
  let url: String
  let title: String?
  let range: NSRange
}

public struct LinkRuleProvider: MarkdownRuleProvidable {
  
  // Matches Markdown links=
  public static let regex = try! NSRegularExpression(
    pattern: #"""
(?x)
(
  \[(.*?)\]\((\S+?)(?:\s+"(.*?)")?\)         # Inline link
| \[(.*?)\]\[(.*?)\]                         # Reference link
| \[(.*?)\]\[\]                              # Empty reference link
| ^\[(.+?)\]:\s*(\S+)(?:\s+"(.*?)")?         # Reference definition
| <?(https?:\/\/[^\s>]+)>?                  # Auto-detected link
)
"""#,
    options: [.anchorsMatchLines]
  )
  
  public static func rule<T>(with style: T) -> Rule where T: MarkdownStyleable {
    return .init(
      regex: regex,
      textRules: [
        .foregroundColor(style.linkStyle.foregroundColor),
        .default(name: .link) { content, _ in
          let links = parseMarkdownLink(content)
          guard let link = links.first, links.count == 1 else {
            return
          }
          return link.url
        }
      ]
    )
  }
  
  private static func parseMarkdownLink(_ markdown: String) -> [MarkdownLink] {
    var links: [MarkdownLink] = []
    var referenceMap: [String: (url: String, title: String?)] = [:]
    let nsString = markdown as NSString
    let matches = regex.matches(in: markdown, range: NSRange(location: 0, length: nsString.length))
    
    for match in matches {
      switch true {
      case match.range(at: 2).location != NSNotFound:
        // Inline link: [text](url "title")
        let text = nsString.substring(with: match.range(at: 2))
        let url = nsString.substring(with: match.range(at: 3))
        let title = match.range(at: 4).location != NSNotFound ? nsString.substring(with: match.range(at: 4)) : nil
        links.append(.init(text: text, url: url, title: title, range: match.range))
        
      case match.range(at: 5).location != NSNotFound:
        // Reference-style link: [text][ref]
        let text = nsString.substring(with: match.range(at: 5))
        let ref = nsString.substring(with: match.range(at: 6)).lowercased()
        if let target = referenceMap[ref] {
          links.append(.init(text: text, url: target.url, title: target.title, range: match.range))
        }
        
      case match.range(at: 7).location != NSNotFound:
        // Empty reference: [text][]
        let text = nsString.substring(with: match.range(at: 7))
        let ref = text.lowercased()
        if let target = referenceMap[ref] {
          links.append(.init(text: text, url: target.url, title: target.title, range: match.range))
        }
        
      case match.range(at: 8).location != NSNotFound:
        // Reference definition: [ref]: url "title"
        let ref = nsString.substring(with: match.range(at: 8)).lowercased()
        let url = nsString.substring(with: match.range(at: 9))
        let title = match.range(at: 10).location != NSNotFound ? nsString.substring(with: match.range(at: 10)) : nil
        referenceMap[ref] = (url, title)
        
      case match.range(at: 11).location != NSNotFound:
        // Auto link: <http://...> or http://...
        let url = nsString.substring(with: match.range(at: 11))
        links.append(.init(text: url, url: url, title: nil, range: match.range))
        
      default:
        continue
      }
    }
    
    return links
  }
}
