//
//  ContentView.swift
//  TeamNavigator
//
//  Created by Berkay Baltaci on 11/10/2023.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      let employees = Api.getAllEmployees()
      let randomEmployee = employees.randomElement() ?? employees[0]
//      let randomEmployee = employees[1]
      EmployeeProfileView(employee: randomEmployee)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
