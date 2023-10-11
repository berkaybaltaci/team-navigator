//
//  ViewExtensions.swift
//  TeamNavigator
//
//  Created by Berkay Baltaci on 11/10/2023.
//

import SwiftUI

struct RoundedRectangleBackground: ViewModifier {
  var color: Color
  func body(content: Content) -> some View {
    content
      .background(
        RoundedRectangle(cornerRadius: 10)
          .fill(color)
      )
  }
}

extension View {
  func withRoundedBackground(_ color: Color) -> some View {
    return self.modifier(RoundedRectangleBackground(color: color))
  }
}
