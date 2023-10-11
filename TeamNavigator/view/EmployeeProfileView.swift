//
//  EmployeeProfile.swift
//  TeamNavigator
//
//  Created by Berkay Baltaci on 11/10/2023.
//

import SwiftUI

struct EmployeeProfileView: View {
  var body: some View {
    VStack(alignment: .leading) {
      employeeInfo()
      Spacer()
      employeeTeam()
      Spacer()
      employeeDetail()
      Spacer()
      employeeManager()
    }
    .padding(.horizontal, 15)
    .padding(.vertical, 50)
  }

  private func employeeInfo() -> some View {
    VStack(alignment: .leading) {
      Text("Gbenga Ojo-Aromokudu")
      Text("Software Engineer")
        .foregroundColor(.white)
      Text("Account | Wallet")
        .foregroundColor(.white)
    }
    .padding(.all, 10)
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(.gray)
  }

  private func employeeTeam() -> some View {
    VStack(alignment: .leading) {
      Text("Gbenga works with...")
        .padding(.bottom, 50)
      VStack(spacing: 20) {
        employeeRow()
        employeeRow()
        employeeRow()
        employeeRow()
      }
    }
    .padding(.all, 10)
    .background(.gray)
  }

  private func employeeDetail() -> some View {
    VStack(alignment: .leading) {
      Text("30031629")
      Text("gbenja.ojoaromokudu@mnscorp.net")
    }
    .padding(10)
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(.gray)
  }

  private func employeeManager() -> some View {
    VStack(alignment: .leading) {
      Text("Gbenja reports to...")
      Text("Maryam Naseri")
    }
    .padding(10)
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(.gray)
  }

  private func employeeRow() -> some View {
    HStack {
      Spacer()
      tile()
      Spacer()
      tile()
      Spacer()
      tile()
      Spacer()
    }
  }

  private func tile() -> some View {
    VStack {
      Text("NAME")
        .foregroundColor(.white)
      Text("Engineer")
        .foregroundColor(.white)
    }
    .padding(.all, 5)
    .background(Color(red: 192.0/255.0, green: 192.0/255.0, blue: 192.0/255.0))
  }
}


struct EmployeeProfileView_Previews: PreviewProvider {
  static var previews: some View {
    EmployeeProfileView()
  }
}
