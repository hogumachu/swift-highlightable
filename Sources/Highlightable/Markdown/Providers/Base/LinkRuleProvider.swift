//
//  LinkRuleProvider.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import SwiftUI

public struct LinkRuleProvider: MarkdownRuleProvidable {
  
  // Matches Markdown links: [text](url)
  public static let regex = try! NSRegularExpression(
    pattern: #"\[(.*?)\]\((\S+?)(?:\s+"(.*?)")?\)"#,
    options: []
  )
  
  public static func rule<T>(with style: T) -> Rule where T: MarkdownStyleable {
    return .init(
      regex: regex,
      textRules: [
        .underlineStyle(.single),
        .foregroundColor(style.lighterColor), // TODO: - Add Color Dependency
        // TODO: - Setup title & link & description
        .default(name: .link) { content, _ in
          let matches = regex.matches(in: content, range: NSRange(content.startIndex..., in: content))
          for match in matches {
            let titleRange = Range(match.range(at: 1), in: content)
            let urlRange = Range(match.range(at: 2), in: content)
            let descriptionRange = Range(match.range(at: 3), in: content)
            
            let title = titleRange.map { String(content[$0]) } ?? ""
            let url = urlRange.map { String(content[$0]) } ?? ""
            let description = descriptionRange.map { String(content[$0]) } ?? ""
            
            print("Title: \(title)")
            print("URL: \(url)")
            print("Description: \(description)")
            print("---")
          }
          return
        }
      ]
    )
  }
}
