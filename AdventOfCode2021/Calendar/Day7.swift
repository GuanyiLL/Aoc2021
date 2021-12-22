//
//  Day7.swift
//  AdventOfCode2021
//
//  Created by guanyi on 2021/12/22.
//

import Cocoa

class Day7: Solution {

    override var id: Int { 7 }
    
    lazy var inputs: [Int] = {
        puzzle[0].split(separator: ",").compactMap{ Int($0) }
    }()
    
    typealias Calculator = (Int) -> Int
    
    func helper(_ cal: Calculator) -> Int {
        let set = Set(inputs)
        var map = Dictionary(uniqueKeysWithValues: zip(set, Array(repeating: 0, count: set.count)))
        let range = inputs.min()!...inputs.max()!
        var state = Dictionary(uniqueKeysWithValues: zip(range, Array(repeating: 0, count: range.count)))
        var fules = [Int : Int]()
        for target in state.keys {
            for position in inputs {
                let distance = abs(position - target)
                let fuel: Int
                if fules[distance] != nil {
                    fuel = fules[distance]!
                } else {
                    fuel = cal(distance)
                    fules[distance] = fuel
                }
                map[position]! += fuel
            }
            state[target] = map.values.reduce(0, +)
            map = Dictionary(uniqueKeysWithValues: zip(set, Array(repeating: 0, count: set.count)))
        }
        return state.values.sorted().first!
    }
    
    func part1() -> Int {
        return helper {
            return $0
        }
    }
    
    func part2() -> Int {
        return helper { dis in
            var count = dis
            var sum = 0
            while count > 0 {
                sum += count
                count -= 1
            }
            return sum
        }
    }
    
    
}
