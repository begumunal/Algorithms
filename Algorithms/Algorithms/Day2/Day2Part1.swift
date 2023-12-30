//
//  Day2Part1.swift
//  Demo
//
//  Created by Begum Unal on 5.12.2023.
//

import Foundation

public class Day2Part1 {
  func printLine() {
    let filename = "Day2Datas.txt"
    
    let redCount = 12
    let blueCount = 14
    let greenCount = 13

    var sections = [String]()
    var deneme = [Int]()
    
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
            
            for dataSection in sections {
              let colors = ["red", "blue", "green"]
              var colorCounts: [String: Int] = [:]
              
              for color in colors {
                let colorCount = dataSection.components(separatedBy: ",").filter { $0.hasSuffix(color) }.map { $0.prefix(while: { !$0.isLetter }) }
                let count = colorCount.compactMap { Int($0) }.reduce(0, +)
                colorCounts[color] = count
              }
              
              if colorCounts["red"] ?? 0 <= redCount && colorCounts["blue"] ?? 0 <= blueCount && colorCounts["green"]! <= greenCount {
                deneme.append(1)
              } else {
                deneme.append(0)
              }
            }
            
            let allOnes = deneme.allSatisfy { $0 == 1 }

            if allOnes {
              total += i
            } else {

            }
            
            deneme = []
            sections = []
          }
        }
      }
      
      print(total)
    } catch {
      
    }
    
  }
}
