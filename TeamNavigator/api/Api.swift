//
//  Api.swift
//  TeamNavigator
//
//  Created by Berkay Baltaci on 11/10/2023.
//

import Foundation

class Api {
  static var allEmployees: [Employee]?

  static func getAllEmployees() -> [Employee] {
    if allEmployees == nil {
      allEmployees = CSVReader.readCSVFile()
    }
    return allEmployees!
  }
}
