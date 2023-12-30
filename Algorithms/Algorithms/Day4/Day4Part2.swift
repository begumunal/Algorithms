//
//  Day4Part2.swift
//  Demo
//
//  Created by Begum Unal on 9.12.2023.
//

import Foundation

private class Day4Part2 {
  private func calculate() {
    let fileName = "Day4Data.txt"

    do {
      let data = try String(contentsOfFile: fileName)
      let lines = data.split(separator: "\n")
      let lineCount = lines.count
      
      var matches = [Int]()
      
      var total = 1
      
      for i in 0...lineCount - 1 {
        var cardNumber = i + 1
        let line = lines[i]
        
        if let range1 = line.range(of: ":") {
          let stringLine = line[range1.upperBound..<line.endIndex]
          
          if let range2 = stringLine.range(of: "|") {
            let winnerString = stringLine[stringLine.startIndex..<range2.lowerBound]
            let mineString = stringLine[range2.upperBound..<stringLine.endIndex]
            
            let winnerNumbers = winnerString.split { !$0.isNumber }
              .compactMap { Int($0) }
            let mineNumbers = mineString.split { !$0.isNumber }
              .compactMap { Int($0) }

            var counter = 0
            
            for winnerNumber in winnerNumbers {
              for mineNumber in mineNumbers {
                if winnerNumber == mineNumber {
                  counter += 1
                }
              }
            }
            
            let count = matches.filter { $0 == cardNumber }.count + 1
            //counter *= (count + 1)
            
            if counter != 0 {
              for _ in 1...count {
                for j in 1...counter {
                  matches.append(cardNumber + j)
                }
              }
            }
          }
        }
      }
      
      print(matches.count + lineCount)
    } catch {
      
    }
  }
}
