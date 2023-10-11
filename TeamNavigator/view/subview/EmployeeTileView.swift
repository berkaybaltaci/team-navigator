//
//  EmployeeTileView.swift
//  TeamNavigator
//
//  Created by Berkay Baltaci on 11/10/2023.
//

import SwiftUI

struct EmployeeTileView: View {
  let employee: Employee

  var body: some View {
    NavigationLink(destination: EmployeeProfileView(employee: employee)) {
      VStack {
        Text(employee.fullName)
          .foregroundColor(.white)
          .font(.system(size: 16))
          .bold()
          .padding(.bottom, 3)
        Text(employee.jobDescription)
          .foregroundColor(.white)
          .font(.system(size: 14))
      }
      .padding(.all, 5)
      .frame(width: UIScreen.screenWidth / 2 - 30, height: UIScreen.screenHeight / 9)
      .withRoundedBackground(Color.secondaryBackground)
    }
  }
}
