//
//  HeaderView.swift
//  swift-highlightable
//
//  Created by 홍성준 on 4/16/25.
//

import Highlightable
import SwiftUI

struct HeaderView: View {
  @State var markdown = """
# Header 1
## Header 2
### Header 3
#### Header 4
##### Header 5
###### Header 6
####### Header level 7 is not supported
This is plain text
"""
  
  var body: some View {
    MarkdownHighlighter(text: $markdown)
  }
}
