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
        let inputs = puzzle
            .map {
                $0
                    .split(separator: "|")
                    .map{ $0.split(separator: " ")
                    .map{ String($0) }
                    }
                
            }
            .flatMap{ $0 }
        return inputs
    }()
    
    func part1() -> Int {
        var res = 0
        for (i, outputDigits) in inputs.enumerated() where i % 2 != 0 {
            for digit in outputDigits {
                switch digit.count {
                case 2: fallthrough
                case 4: fallthrough
                case 3: fallthrough
                case 7:
                    res += 1
                default: break
                }
            }
        }
        return res
    }
    
    /*
     dddd
    e    a
    e    a
     ffff
    g    b
    g    b
     cccc
     */
    func part2() -> Int {
        var res = 0
        var digits = ["acedgfb": 8,
                      "cdfbe": 5,
                      "gcdfa": 2,
                      "fbcad": 3,
                      "dab": 7,
                      "cefabd": 9,
                      "cdfgeb": 6,
                      "eafb": 4,
                      "cagedb": 0,
                      "ab": 1]
        let digits2 = Dictionary(uniqueKeysWithValues: digits.lazy.map{ (Set($0), $1) })
        let ordered = digits.map { $0.key }.sorted()
        
        for (i, outputDigits) in inputs.enumerated() where i % 2 != 0 {
            var number = 0
            
            for digit in outputDigits {
                var current: Int = -1
                switch digit.count {
                case 2: fallthrough
                case 4: fallthrough
                case 3: fallthrough
                case 7:
                    current = digit.count
                default:
                    if let n = digits2[Set(digit)] {
                        current = n
                    } else {
                        for item in ordered {
                            if item.count == digit.count {
                                current = digits2[Set(item)]!
                            }
                        }
                    }
                }
                print(digit)
                number = number * 10 + current
            }
            print(number)
            res += number
        }
        
        return res
    }
}
