//
//  RegexHelper.swift
//  TeamNavigator
//
//  Created by Berkay Baltaci on 11/10/2023.
//

import Foundation

class RegexHelper {
  static func extractWordsAroundTilde(from input: String) -> (String, String)? {
    let pattern = "(\\w+) ~ (\\w+)"
    if let regex = try? NSRegularExpression(pattern: pattern) {
      if let match = regex.firstMatch(in: input, options: [], range: NSRange(input.startIndex..., in: input)) {
        let rangeBefore = Range(match.range(at: 1), in: input)!
        let rangeAfter = Range(match.range(at: 2), in: input)!
        
        let wordBefore = String(input[rangeBefore])
        let wordAfter = String(input[rangeAfter])
        
        return (wordBefore, wordAfter)
      }
    }
    return nil
  }
  
  static func getBaseString(from input: String) -> String? {
    let pattern = "(\\w+) ~ (\\w+)"
    if let regex = try? NSRegularExpression(pattern: pattern) {
      if let match = regex.firstMatch(in: input, options: [], range: NSRange(input.startIndex..., in: input)) {
        let rangeBefore = Range(match.range(at: 1), in: input)!
        let rangeAfter = Range(match.range(at: 2), in: input)!
        
        let wordBefore = String(input[rangeBefore])
        let wordAfter = String(input[rangeAfter])
        
        let rangeFullMatch = Range(match.range, in: input)!
        let stringWithoutWords = input.replacingCharacters(in: rangeFullMatch, with: "")
        
        return stringWithoutWords
      }
    }
    return nil
  }
}
