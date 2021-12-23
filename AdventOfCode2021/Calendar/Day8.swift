//
//  Day8.swift
//  AdventOfCode2021
//
//  Created by guanyi on 2021/12/23.
//

import Cocoa

/*
 0:      1:      2:      3:      4:
  aaaa    ....    aaaa    aaaa    ....
 b    c  .    c  .    c  .    c  b    c
 b    c  .    c  .    c  .    c  b    c
  ....    ....    dddd    dddd    dddd
 e    f  .    f  e    .  .    f  .    f
 e    f  .    f  e    .  .    f  .    f
  gggg    ....    gggg    gggg    ....

   5:      6:      7:      8:      9:
  aaaa    aaaa    aaaa    aaaa    aaaa
 b    .  b    .  .    c  b    c  b    c
 b    .  b    .  .    c  b    c  b    c
  dddd    dddd    ....    dddd    dddd
 .    f  e    f  .    f  e    f  .    f
 .    f  e    f  .    f  e    f  .    f
  gggg    gggg    ....    gggg    gggg

 */

class Day8: Solution {
    override var id: Int { 0 }
    
    lazy var inputs:[[String]] = {
        let inputs = puzzle.map {
            $0.split(separator: " ").map{ String($0) }
        }
        return inputs
    }()
    
    func part1() -> Int {
//        var state:[Set<String>] = [["c","f"],
//                                   ["b","c","d","f"],
//                                   ["a","c","f"],
//                                   ["a","b","c","d","e","f","g"]]
        
        var state:[Set<String>] = [["c","f"],
                                   ["b","c","d","f"],
                                   ["a","c","f"],
                                   ["a","b","c","d","e","f","g"]]
        
        
        var data = [String]()
        for idx in 0..<inputs.count {
            if idx % 2 != 0 {
                data.append(contentsOf: inputs[idx])
            }
        }
        var count = 0
   
        for digit in data {

            var tmpCount = 0
            for digitSet in state {
                
                let tmp = Set<String>(digit.map{ String($0) })
                
                print("tmp: \(tmp), digitSet: \(digitSet)")
                
                if tmp.isSubset(of: digitSet) {
                    tmpCount += 1
                }
            }
            
            if tmpCount == 1 {
                count += 1
                tmpCount = 0
            }
        }

        return count
    }
    
    func part2() -> Int {
        return 0
    }
}
