//
//import Foundation
//
//let fileName = "Day3Data.txt"
//
//let schematic = """
//467..114..
//...*......
//..35..633.
//......#...
//617*......
//.....+.58.
//..592.....
//......755.
//...$.*....
//.664.598..
//"""
//
//
//var hasSpecialCharacter = false
//
//var startIndex: String.Index?
//var endIndex: String.Index?
//var beforeStartIndex: String.Index?
//var afterEndIndex: String.Index?
//var oldLine = "", newLine = ""
//
//var lines = [String]()
//var line = ""
//
//do {
//  let data = try String(contentsOfFile: fileName)
//  lines = data.split(separator: "\n").map { String($0) }
//
//  var total = 0
//
//  for i in 0...lines.count - 1 {
//    line = lines[i]
//
//    for (index, char) in line.enumerated() {
//      if char.isNumber {
//        if startIndex == nil {
//          startIndex = line.index(line.startIndex, offsetBy: index)
//        }
//
//        endIndex = line.index(line.startIndex, offsetBy: index)
//      } else {
//        if let start = startIndex {
//
//          if start != line.startIndex {
//            beforeStartIndex = line.index(before: start)
//
//            let beforeStartIndexCharacter = line[beforeStartIndex!]
//
//            if beforeStartIndexCharacter.isNumber || beforeStartIndexCharacter == "." {
//              sag(endIndex: endIndex, line: String(line), i: i)
//            } else {
//              hasSpecialCharacter = true
//            }
//
//          } else {
//            sag(endIndex: endIndex, line: String(line), i: i)
//          }
//
//
//          if hasSpecialCharacter {
//            let num = line[start...endIndex!]
//            total += Int(num) ?? 0
//          }
//        }
//
//        startIndex = nil
//        endIndex = nil
//        hasSpecialCharacter = false
//        
//        beforeStartIndex = nil
//        afterEndIndex = nil
//      }
//    }
//    
//  }
//
//  print(total)
//} catch {
//  print("data stringe cevirilemedi")
//}
//
//
//func sag(endIndex: String.Index?, line: String, i: Int) {
//  if let end = endIndex {
//    if end != line.index(line.endIndex, offsetBy: -1) {
//      print(line.count)
//      afterEndIndex = line.index(after: end)
//
//      let afterEndIndexCharacter = line[afterEndIndex!]
//
//      if afterEndIndexCharacter.isNumber || afterEndIndexCharacter == "." {
//        alt(i: i)
//      } else {
//        hasSpecialCharacter = true
//      }
//    } else {
//      alt(i: i)
//    }
//  }
//
//}
//
//func alt(i: Int) {
//  if i != lines.count - 1 {
//    newLine = String(lines[i + 1])
//    print(newLine)
//
//    if (beforeStartIndex ?? startIndex) ?? newLine.startIndex < newLine.endIndex && (afterEndIndex ?? endIndex) ?? newLine.endIndex < newLine.endIndex {
//      let subString = newLine[((beforeStartIndex ?? startIndex) ?? newLine.startIndex)...((afterEndIndex ?? endIndex) ?? newLine.endIndex)]
//
//      print("Substring: \(subString)")
//
//      for (_, char) in subString.enumerated() {
//        if char.isNumber || char == "." {
//          ust(i: i)
//        } else {
//          hasSpecialCharacter = true
//        }
//      }
//    }
//  } else {
//    ust(i: i)
//  }
//}
//
//func ust(i: Int) {
//  if i != 0 {
//    oldLine = String(lines[i - 1])
//    print(oldLine)
//
//    if let beforeStartIndex = beforeStartIndex, let afterEndIndex = afterEndIndex {
//      let subString = oldLine[beforeStartIndex...afterEndIndex]
//
//      for (_, char) in subString.enumerated() {
//        if char.isNumber || char == "." {
//
//        } else {
//          hasSpecialCharacter = true
//        }
//      }
//    }
//  } else {
//
//  }
//}
