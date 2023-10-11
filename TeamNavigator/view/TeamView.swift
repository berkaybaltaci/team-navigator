//
//  TeamView.swift
//  TeamNavigator
//
//  Created by Berkay Baltaci on 11/10/2023.
//

import SwiftUI

struct TeamView: View {
  var teamName: String
  var teamColleagues: [Employee]

  var body: some View {
    VStack(alignment: .leading) {
      Text(teamName)
        .font(.system(size: 30))
        .multilineTextAlignment(.center)
        .foregroundColor(.primaryText)
        .padding(.all, 20)
      VStack(spacing: 10) {
        let chunks = teamColleagues.chunks(of: 2)
        ForEach(chunks, id: \.self) { chunk in
          employeeRow(arr: chunk)
        }
      }
      Spacer()
    }
    .padding(.all, 10)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .withRoundedBackground(Color.primaryBackground)
  }

  private func employeeRow(arr: [Employee]) -> some View {
    HStack {
      Spacer()
      ForEach(arr, id: \.id) { employee in
        EmployeeTileView(employee: employee)
        Spacer()
      }
    }
  }
}
