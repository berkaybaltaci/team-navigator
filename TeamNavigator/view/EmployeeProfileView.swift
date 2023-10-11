//
//  EmployeeProfile.swift
//  TeamNavigator
//
//  Created by Berkay Baltaci on 11/10/2023.
//

import SwiftUI

struct EmployeeProfileView: View {
  var employee: Employee

  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        employeeInfo(employee)
        Spacer()
        employeeTeam()
        Spacer()
        employeeDetail()
        Spacer()
        employeeManager()
      }
      .padding(.horizontal, 15)
      .padding(.vertical, 20)
    }
  }

  private func employeeInfo(_ employee: Employee) -> some View {
    VStack(alignment: .leading) {
      Text("\(employee.firstName) \(employee.lastName)")
        .font(.system(size: 22))
        .foregroundColor(.primaryText)
      Text(employee.jobDescription)
        .foregroundColor(.secondaryText)
      Text(employee.teamStructure)
        .foregroundColor(.secondaryText)
    }
    .padding(.all, 10)
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(
      Rectangle()
        .fill(Color.primaryBackground)
        .cornerRadius(10)
    )
  }

  private func employeeTeam() -> some View {
    VStack(alignment: .leading) {
      Text("\(employee.fullName) works with...")
        .foregroundColor(.primaryText)
        .padding(.bottom, 20)
      VStack(spacing: 10) {
        // TODO: Find a better solution if you have time left
        let teammates = CSVReader.readCSVFile().filter {
                    $0.teamStructure == employee.teamStructure && $0.employeeID != employee.employeeID
//          !$0.teamStructure.isEmpty
        }
        if teammates.isEmpty {
          Text("NO ONE :(")
        } else {
          let chunks = teammates.chunks(of: 2)
          ForEach(chunks, id: \.self) { chunk in
            employeeRow(arr: chunk)
          }
        }
      }
    }
    .padding(.all, 10)
    .withRoundedBackground(Color.primaryBackground)
  }

  private func employeeDetail() -> some View {
    VStack(alignment: .leading, spacing: 7) {
      HStack {
        Image(systemName: "person.fill")
          .frame(width: 24)
        Text(employee.id)
          .foregroundColor(.primaryText)
      }
      HStack {
        Image(systemName: "envelope.fill")
          .frame(width: 24)
        Text(employee.userName)
          .foregroundColor(.primaryText)
      }
    }
    .padding(10)
    .frame(maxWidth: .infinity, alignment: .leading)
    .withRoundedBackground(Color.primaryBackground)
  }

  private func employeeManager() -> some View {
    VStack(alignment: .leading) {
      Text("\(employee.fullName) reports to...")
        .foregroundColor(.primaryText)
      if let manager = Api.getAllEmployees().first(where: { $0.employeeID == employee.supervisorID }) {
        NavigationLink(destination: EmployeeProfileView(employee: manager)) {
          Text(employee.supervisorName)
        }
      } else {
        Text("Manager ID was not found in the database")
          .foregroundColor(.primaryCta)
          .italic()
      }
    }
    .padding(10)
    .frame(maxWidth: .infinity, alignment: .leading)
    .withRoundedBackground(Color.primaryBackground)
  }

  private func employeeRow(arr: [Employee]) -> some View {
    HStack {
      Spacer()
      ForEach(arr, id: \.id) { employee in
        tile(employee)
        Spacer()
      }
    }
  }

  private func tile(_ employee: Employee) -> some View {
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


struct EmployeeProfileView_Previews: PreviewProvider {
  static var previews: some View {
    EmployeeProfileView(employee: CSVReader.readCSVFile()[0])
  }
}
