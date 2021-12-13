//
//  Day3.swift
//  SwiftCommandLine
//
//  Created by EthanGuan on 2021/12/12.
//

import Foundation

class Day3: Solution {
    override func getID() -> Int { 3 }
    
    func part1() -> Int {
        let datas = puzzle.map {
            $0.compactMap{
                Int(String($0))
            }
        }
 
        var zeroCount = 0
        var oneCount = 0
        
        var row = 0
        var col = 0
        
        var gammaString = ""
        var epsilonString = ""
        
        while col < datas[0].count {
            if datas[row][col] == 0 {
                zeroCount += 1
            } else {
                oneCount += 1
            }
            row += 1
            
            if row > datas.count - 1 {
                if zeroCount < oneCount {
                    gammaString += "1"
                    epsilonString += "0"
                } else {
                    gammaString += "0"
                    epsilonString += "1"
                }
                row = 0
                col += 1
                zeroCount = 0
                oneCount = 0
            }
        }
        
        let gamma = Int(gammaString, radix: 2)!
        let epsilon = Int(epsilonString, radix: 2)!
        
        return gamma * epsilon
    }
    
    func part2() -> Int {
        
        return 0
    }
}
