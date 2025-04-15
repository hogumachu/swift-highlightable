//
//  SystemExtensions.swift
//  swift-highlightable
//
//  Created by sungjun.hong on 4/13/25.
//

import SwiftUI

#if os(macOS)
import AppKit

public typealias SystemFont = NSFont
public typealias SystemColor = NSColor
public typealias SystemTextView = NSTextView
public typealias SystemScrollView = NSScrollView
public typealias SystemFontDescriptor = NSFontDescriptor

#else
import UIKit

public typealias SystemFont = UIFont
public typealias SystemColor = UIColor
public typealias SystemTextView = UITextView
public typealias SystemScrollView = UIScrollView
public typealias SystemFontDescriptor = UIFontDescriptor
#endif

public typealias SystemSymbolicTraits = SystemFontDescriptor.SymbolicTraits
