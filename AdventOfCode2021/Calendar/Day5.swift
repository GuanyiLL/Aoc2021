//
//  Day5.swift
//  AdventOfCode2021
//
//  Created by guanyi on 2021/12/20.
//

import Foundation

class Day5 : Solution {
    
    struct Point: Hashable, CustomStringConvertible {
        var description: String {
            return "(\(x),\(y))"
        }
        var x: Int
        var y: Int
    }
    
    override func getID() -> Int {
        return 5
    }
    
    var maxOverlap = 2
    
    lazy var inputs: [[Point]] = {
        return puzzle.map {
            $0
                .split(separator: " ")
                .map { $0.split(separator: ",").compactMap { Int($0) } }
                .filter { $0.count > 0 }
                .map { Point(x: $0[0], y: $0[1]) }
        }
    }()
    
    func isStraightLine(_ startPoint: Point, _ endPoint: Point) -> Bool {
        return startPoint.x == endPoint.x || startPoint.y == endPoint.y
    }
    
    func isDiagonalLine(_ startPoint: Point, _ endPoint: Point) -> Bool {
        return (abs(startPoint.x - endPoint.x) == abs(startPoint.y - endPoint.y)) ||
        (startPoint.x == endPoint.y && startPoint.y == endPoint.x)
    }
    
    func isVertical(_ startPoint: Point, _ endPoint: Point) -> Bool {
        return startPoint.x == endPoint.x
    }
    
    func isHorizontal(_ startPoint: Point, _ endPoint: Point) -> Bool {
        return startPoint.y == endPoint.y
    }
    
    func part1() -> Int {
        let datas = inputs.filter { line in
            return line[0].x == line[1].x || line[0].y == line[1].y
        }
        
        var map = [Point: Int]()
        
        for line in datas {
            if isVertical(line[0], line[1]) {
                let step = line[0].y - line[1].y > 0 ? -1 : 1
                for i in stride(from: line[0].y, through: line[1].y, by: step) {
                    let p = Point(x: line[0].x, y: i)
                    map[p, default: 0] += 1
                }
            } else {
                let step = line[0].x - line[1].x > 0 ? -1 : 1
                for i in stride(from: line[0].x, through: line[1].x, by: step) {
                    let p = Point(x: i, y: line[0].y)
                    map[p, default: 0] += 1
                }
            }
        }
        
        return map.values.filter { $0 > 1 }.count
    }
    
    func part2() -> Int {
        let datas = inputs.filter { line in
            return isStraightLine(line[0], line[1])
            || isDiagonalLine(line[0], line[1])
        }
        
        var map = [Point: Int]()
        
        for line in datas {
            if isVertical(line[0], line[1]) {
                let step = line[0].y - line[1].y > 0 ? -1 : 1
                for i in stride(from: line[0].y, through: line[1].y, by: step) {
                    let p = Point(x: line[0].x, y: i)
                    map[p, default: 0] += 1
                }
            } else if isHorizontal(line[0], line[1]) {
                let step = line[0].x - line[1].x > 0 ? -1 : 1
                for i in stride(from: line[0].x, through: line[1].x, by: step) {
                    let p = Point(x: i, y: line[0].y)
                    map[p, default: 0] += 1
                }
            } else {
                if line[0].x - line[1].x == line[0].y - line[1].y {
                    let step = line[0].x - line[1].x > 0 ? -1 : 1
                    for i in stride(from: line[0].x, through: line[1].x, by: step) {
                        let p = Point(x: i, y: line[0].y - (line[0].x - i))
                        map[p, default: 0] += 1
                    }
                } else {
                    let step = line[0].x - line[1].x > 0 ? -1 : 1
                    for i in stride(from: line[0].x, through: line[1].x, by: step) {
                        let p = Point(x: i, y: line[0].y + (line[0].x - i))
                        map[p, default: 0] += 1
                    }
                }
            }
        }
        
        return map.values.filter { $0 > 1 }.count
    }
}
