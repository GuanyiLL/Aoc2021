//
//  Day3.swift
//  SwiftCommandLine
//
//  Created by EthanGuan on 2021/12/12.
//

import Foundation

class Day3 : Solution {
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
        let datas = puzzle.map {
            $0.compactMap{
                Int(String($0))
            }
        }

        let oxygenRate = getRate(true, datas)
        let CO2Rate = getRate(false, datas)

        return oxygenRate * CO2Rate
    }
    
    func getRate(_ oxygen: Bool, _ datas: [[Int]]) -> Int {
        var datas = datas
        
        var zeroCount = 0
        var oneCount = 0
        
        var row = 0
        var col = 0
    
        while datas.count > 1 {
            if datas[row][col] == 0 {
                zeroCount += 1
            } else {
                oneCount += 1
            }
            row += 1
            
            if row > datas.count - 1 {
                if zeroCount <= oneCount {
                    datas = datas.filter { $0[col] == oxygen.intValue() }
                } else {
                    datas = datas.filter { $0[col] == (!oxygen).intValue() }
                }
                row = 0
                col += 1
                zeroCount = 0
                oneCount = 0
            }
        }
        let tmpStr = datas[0].map{ "\($0)" }.reduce("", +)
        return  Int(tmpStr, radix: 2)!
    }
    
    
}

extension Bool {
    func intValue() -> Int {
        return self ? 1 : 0
    }
}
