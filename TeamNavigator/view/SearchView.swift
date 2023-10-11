//
//  SearchView.swift
//  TeamNavigator
//
//  Created by Berkay Baltaci on 11/10/2023.
//

import SwiftUI

struct SearchView: View {
  enum SearchCategory {
    case employees
    case teams
  }

  @State private var searchText = ""
  @State private var searchCategory: SearchCategory = .employees
  @State private var employeeSearchResults: [Employee] = []
  @State private var teamSearchResults: [String] = []

  var body: some View {
    VStack {
      Picker("Search for", selection: $searchCategory) {
        Text("Employees").tag(SearchCategory.employees)
        Text("Teams").tag(SearchCategory.teams)
      }
      .pickerStyle(SegmentedPickerStyle())
      .padding()

      TextField("Search for \(searchCategory == .employees ? "employees" : "teams")...", text: $searchText)
        .padding()
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .autocapitalization(.none)
        .disableAutocorrection(true)
        .onChange(of: searchText) { newValue in
          if searchCategory == .employees {
            employeeSearchResults = Api.getAllEmployees().filter { employee in
              employee.fullName.lowercased().contains(newValue.lowercased())
            }
          } else {
            teamSearchResults = Api.getAllEmployees()
              .map { $0.teamStructure }
              .filter { $0.lowercased().contains(newValue.lowercased()) }
          }
        }

      if searchCategory == .employees {
        List(employeeSearchResults, id: \.id) { employee in
          NavigationLink(destination: EmployeeProfileView(employee: employee)) {
            HStack {
              Text("\(employee.fullName) - \(employee.jobDescription)")
            }
          }
        }
      } else {
        List(teamSearchResults, id: \.self) { team in
          NavigationLink(destination: TeamView(teamName: team, teamColleagues: Api.getAllEmployees().filter { $0.teamStructure == team })) {
            Text(team)
          }
        }
      }
    }
  }
}
