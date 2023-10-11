//
//  Employee.swift
//  TeamNavigator
//
//  Created by Berkay Baltaci on 11/10/2023.
//

import Foundation

struct Employee: Identifiable, Hashable {
  var id: String {
    employeeID
  }

  var fullName: String {
    firstName + " " + lastName
  }

  var employeeID: String
  var firstName: String
  var lastName: String
  var userName: String
  var jobCode: String
  var jobDescription: String
  var supervisorID: String
  var supervisorName: String
  var supervisorUserName: String
  var deptID: String
  var storeHO: String
  var businessUnit: String
  var buDescription: String
  var departmentDesc: String
  var teamStructure: String

  // Implement the hashValue based on a unique property
  func hash(into hasher: inout Hasher) {
      hasher.combine(id)
  }

  // Define the equality check for Hashable conformance
  static func == (lhs: Employee, rhs: Employee) -> Bool {
      return lhs.id == rhs.id
  }
}
