//
//  BlockquoteView.swift
//  Example
//
//  Created by 홍성준 on 4/16/25.
//

import Highlightable
import SwiftUI

struct BlockquoteView: View {
  @State var markdown = """
> This is Blockquote 1
> This is Blockquote 2
> This is Blockquote 3
Not Blockquote 1
Not Blockquote 2
"""
  
  var body: some View {
    MarkdownHighlighter(text: $markdown)
  }
}
