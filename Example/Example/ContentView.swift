//
//  ContentView.swift
//  Example
//
//  Created by 홍성준 on 4/15/25.
//

import Highlightable
import SwiftUI

enum ExampleViews: String, CaseIterable {
  case markdown = "Markdown View"
  case blockquote = "Blockquote View"
  case header = "Header View"
  case link = "Link View"
}

extension ExampleViews {
  @ViewBuilder
  var view: some View {
    switch self {
    case .markdown: MarkdownView()
    case .blockquote: BlockquoteView()
    case .header: HeaderView()
    case .link: LinkView()
    }
  }
}

struct ContentView: View {
  var body: some View {
    NavigationStack {
      List {
        ForEach(ExampleViews.allCases, id: \.rawValue) { example in
          NavigationLink(example.rawValue) {
            example.view
              .navigationTitle(example.rawValue)
          }
        }
      }
    }
  }
}
