//
//  Day2Part2.swift
//  Demo
//
//  Created by Begum Unal on 5.12.2023.
//

import Foundation

private class Day2Part2{
  func printLine() {
    let filename = "Day2Datas.txt"
    
    var sections = [String]()
    var total = 0
    
    do {
      let data = try String(contentsOfFile: filename)
      let withoutSpacesData = data.filter { !$0.isWhitespace }
      let lines = data.split(separator:"\n")
      let lineCount = lines.count
      
      for i in 1...lineCount {
        if let range = withoutSpacesData.range(of: "Game\(i):") {
          let startIndex = range.upperBound
          if let endIndex = withoutSpacesData.range(of: "Game\(i+1):", range: startIndex..<withoutSpacesData.endIndex)?.lowerBound {
            let dataBetweenGames = withoutSpacesData[startIndex..<endIndex]
            
            sections = dataBetweenGames.components(separatedBy: ";")
            
            let colors = ["red", "blue", "green"]
            var colorCounts: [String : Int] = [:]
            
            for color in colors {
              var maxCount = 0
              
              for dataSection in sections {
                let colorCount = dataSection.components(separatedBy: ",")
                  .filter { $0.hasSuffix(color) }
                  .map { $0.prefix(while: { !$0.isLetter }) }
                  .compactMap { Int($0) }
                  .reduce(0, +)
                
                if colorCount > maxCount {
                  maxCount = colorCount
                }
              }
              
              colorCounts[color] = maxCount
            }
            
            let result = colorCounts.values.reduce(1, *)
            total += result
            colorCounts = [:]
          }
        }
      }
      
      print(total)
    } catch {
      
    }
  }
}
