//
//  Day4.swift
//  AdventOfCode2021
//
//  Created by guanyi on 2021/12/14.
//

import Foundation


class Day4 : Solution {
    override var id: Int { 4 }
    
    lazy var inputs: [Int] = {
        return puzzle[0].split(separator: ",").map{Int($0)!}
    }()
    
    typealias Item = (Int, Bool)

    lazy var datas: [[[Item]]] = {
        var count = 0
        var matrixs = [[[Item]]]()
        var matrix = [[Item]]()
        for line in puzzle[1...] {
            let row = line.split(separator: " ").map{ (Int($0)!, false) }
            matrix.append(row)
            count += 1
            if count > 4 {
                count = 0
                matrixs.append(matrix)
                matrix.removeAll()
            }
        }
        return matrixs
    }()
    
    func part1() -> Int {
        for input in inputs {
            let last = mark(input)
            if last.0 != -1 {
                let sum = datas[last.0]
                    .flatMap{ $0 }
                    .filter{ !$0.1 }
                    .map{ $0.0 }
                    .reduce(0, +)
                return last.1 * sum
            }
        }
        return 0
    }
    
    func mark(_ input: Int, _ returnFirst: Bool = true) -> (Int, Int) {
        for (idx, matrix) in datas.enumerated() {
            if winSet[idx, default: false] { continue }
            for row in 0..<matrix.count {
                for col in 0..<matrix[row].count {
                    if matrix[row][col].0 == input {
                        datas[idx][row][col].1 = true
                        if check(idx, row, col) {
                            if returnFirst {
                                return (idx, input)
                            } else {
                                winSet[idx] = true
                                if winSet.count == datas.count {
                                    return (idx, input)
                                }
                            }
                        }
                    }
                }
            }
        }
        return (-1, -1)
    }
    
    func check(_ idx: Int, _ row: Int, _ col: Int) -> Bool {
        let matrix = datas[idx]
        var res = true
        for i in 0..<matrix.count {
            if matrix[i][col].1 != true {
                res = false
                break
            }
        }
        
        if res { return res }
        res = true
        
        for i in 0..<matrix[row].count {
            if matrix[row][i].1 != true {
                res = false
                break
            }
        }
        
        return res
    }
    
    var winSet = [Int:Bool]()
    
    func part2() -> Int {
        for input in inputs {
            let last = mark(input, false)
            if last.0 != -1 {
                let sum = datas[last.0]
                    .flatMap{ $0 }
                    .filter{ !$0.1 }
                    .map{ $0.0 }
                    .reduce(0, +)
                return last.1 * sum
            }
            print(last)
        }
        return 0
    }
}
