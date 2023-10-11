//
//  ExcelReader.swift
//  TeamNavigator
//
//  Created by Berkay Baltaci on 11/10/2023.
//

import Foundation
import SwiftCSV

class CSVReader {
  static func readCSVFile() -> [Employee] {
    do {
      let filePath = Bundle.main.path(forResource: "sample_data", ofType: "csv")
      let fileURL = URL(fileURLWithPath: filePath!)
      let csvFile = try CSV<Named>(url: fileURL)

      var employees: [Employee] = []
        
        func handleTeamStructure (_ teamStructureString: String) -> [String] {
            return teamStructureString.components(separatedBy: "\n")
        }

      for row in csvFile.rows {
        if let employeeID = row["Employee ID"],
           let firstName = row["First Name"],
           let lastName = row["Last Name"],
           let userName = row["User Name"],
           let jobCode = row["Job Code"],
           let jobDescription = row["Job Description"],
           let supervisorID = row["Supervisor ID"],
           let supervisorName = row["Supervisor Name"],
           let supervisorUserName = row["Supervisor UserName"],
           let deptID = row["Dept ID"],
           let storeHO = row["Store/HO"],
           let businessUnit = row["Business Unit"],
           let buDescription = row["BU Description"],
           let departmentDesc = row["Department Desc"],
           let teamStructureString = row["Team Structure"],
           let teamStructure = handleTeamStructure(teamStructureString) {
          let employee = Employee(
            employeeID: employeeID,
            firstName: firstName,
            lastName: lastName,
            userName: userName,
            jobCode: jobCode,
            jobDescription: jobDescription,
            supervisorID: supervisorID,
            supervisorName: supervisorName,
            supervisorUserName: supervisorUserName,
            deptID: deptID,
            storeHO: storeHO,
            businessUnit: businessUnit,
            buDescription: buDescription,
            departmentDesc: departmentDesc,
            teamStructure: teamStructure
          )
          employees.append(employee)
        }
      }

      return employees
    } catch {
      print("Error reading CSV file: \(error)")
      return []
    }
  }

}

