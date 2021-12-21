//
//  Day1.swift
//  SwiftCommandLine
//
//  Created by EthanGuan on 2021/12/12.
//

import Foundation

class Day1 : Solution {
    
    override var id: Int { 1 }
    
    func part1() -> Int {
        let datas = puzzle.compactMap{Int($0)}
        var res = 0
        for num in 1..<datas.count {
            if datas[num] - datas[num - 1] > 0 {
                res += 1
            }
        }
        return res
    }
    
    func part2() -> Int {
        let datas = puzzle.compactMap{Int($0)}
        var res = 0
        for num in 1..<datas.count - 2 {
            if datas[num + 2] - datas[num - 1] > 0 {
                res += 1
            }
        }
        return res
    }
    
}

