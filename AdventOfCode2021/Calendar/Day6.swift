//
//  Day6.swift
//  AdventOfCode2021
//
//  Created by guanyi on 2021/12/21.
//

import Foundation

class Day6 : Solution {
    override var id: Int { 6 }
    
    lazy var inputs = {
        puzzle[0].split(separator: ",").compactMap{ Int($0) }
    }()
    
    func part1() -> Int {
        var time = 80
        var fishpool = inputs
        
        var counter = 0
        
        while time > 0 {
            let size = fishpool.count
            for i in 0..<size {
                if fishpool[i] == 0 {
                    fishpool[i] = 6
                    counter += 1
                    
                } else {
                    fishpool[i] -= 1
                }
            }
            if counter > 0 {
                fishpool.append(contentsOf: Array(repeating: 8, count: counter))
                counter = 0
            }
            time -= 1
        }
        
        return fishpool.count
    }
    
    func part2() -> Int {
        let time = 256
        let fishpool = inputs
        var state = Array(repeating: 0, count: 9)
        for fish in fishpool {
            state[fish] += 1
        }
        
        for _ in 0..<time {
            let newFish = state[0]
            
            for i in 0..<8 {
                state[i] = state[i+1]
            }
            state[6] += newFish
            state[8] = newFish
        }
        
        return state.reduce(0, +)
    }
}
