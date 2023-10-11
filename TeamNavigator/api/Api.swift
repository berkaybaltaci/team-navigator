//
//  Api.swift
//  TeamNavigator
//
//  Created by Berkay Baltaci on 11/10/2023.
//

import Foundation

class Api {
  static func getAllEmployees() -> [Employee] {
    return CSVReader.readCSVFile()
  }
}
