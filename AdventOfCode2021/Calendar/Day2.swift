//
//  Day2.swift
//  AdventOfCode2021
//
//  Created by guanyi on 2021/12/13.
//

import Foundation

class Day2 : Solution {
    override func getID() -> Int { 2 }
    
    var depth = 0
    var horizontal = 0
    var aim = 0
    lazy var datas = puzzle.map { $0.split(separator: " ") }
    
    func part1() -> Int {
        for instruction in datas {
            let action = instruction[0]
            actionHanler(String(action)) {
                depth -= Int(instruction[1])!
            } downAction: {
                depth += Int(instruction[1])!
            } forwardAction: {
                horizontal += Int(instruction[1])!
            }

        }
        return depth * horizontal
    }
    
    func part2() -> Int {
        for instruction in datas {
            let action = instruction[0]
            actionHanler(String(action)) {
                aim -= Int(instruction[1])!
            } downAction: {
                aim += Int(instruction[1])!
            } forwardAction: {
                horizontal += Int(instruction[1])!
                depth += Int(instruction[1])! * aim
            }
        }
        return depth * horizontal
    }
    
    func actionHanler(_ action: String, upAction: ()->(),downAction: ()->(),forwardAction: ()->()) {
        if action == "up" {
            upAction()
        }
        if action == "down" {
            downAction()
        }
        if action == "forward" {
            forwardAction()
        }
    }
}
