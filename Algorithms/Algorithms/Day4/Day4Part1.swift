//
//  Day4Part1.swift
//  Demo
//
//  Created by Begum Unal on 9.12.2023.
//

import Foundation

private class Day4Part1 {
  private func calculate() {
    let fileName = "Day4Data.txt"

    do {
      let data = try String(contentsOfFile: fileName)
      let lines = data.split(separator: "\n")
      let lineCount = lines.count
      
      var total = 0
      
      for i in 0...lineCount - 1 {
        let line = lines[i]
        print(line)
        if let range1 = line.range(of: ":") {
          let stringLine = line[range1.upperBound..<line.endIndex]
          
          if let range2 = stringLine.range(of: "|") {
            let winnerString = stringLine[stringLine.startIndex..<range2.lowerBound]
            let mineString = stringLine[range2.upperBound..<stringLine.endIndex]
            
            let winnerNumbers = winnerString.split { !$0.isNumber }
              .compactMap { Int($0) }
            let mineNumbers = mineString.split { !$0.isNumber }
              .compactMap { Int($0) }
            
            var puan = 0
            var isFirst = true
            
            for winnerNumber in winnerNumbers {
              for mineNumber in mineNumbers {
                if winnerNumber == mineNumber {
                  if isFirst {
                    puan += 1
                    isFirst = false
                  } else {
                    puan *= 2
                  }
                }
              }
            }
            
            total += puan
          }
        }
      }
      
      print(total)
    } catch {
      
    }

  }
}
