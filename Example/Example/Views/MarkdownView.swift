//
//  MarkdownView.swift
//  Example
//
//  Created by 홍성준 on 4/15/25.
//

import Highlightable
import SwiftUI

struct MarkdownView: View {
  @State var markdown: String
  
  init() {
    /// ref: https://gist.github.com/allysonsilva/85fff14a22bbdf55485be947566cc09e
    guard let path = Bundle.main.path(forResource: "markdown-demo", ofType: "md"),
          let content = try? String(contentsOfFile: path) else {
      self.markdown = ""
      return
    }
    self.markdown = content
  }
  
  var body: some View {
    MarkdownHighlighter(text: $markdown)
  }
}
