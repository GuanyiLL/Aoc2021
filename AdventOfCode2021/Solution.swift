//
//  Solution.swift
//  SwiftCommandLine
//
//  Created by EthanGuan on 2021/12/12.
//

import Foundation

protocol SolutionProtocol {
    var id: Int { get set }
    var puzzle: [String] { get set }
    func part1() -> Int
    func part2() -> Int
    func loadPuzzle() throws -> [String]
}

extension SolutionProtocol {
    func loadPuzzle() throws -> [String]  {
        let url = Bundle.main.url(forResource: "\(id)", withExtension: "")!
        let s = try String(contentsOf: url)
        return s.split(separator: "\n").map { String($0) }
    }
    
    func part1() -> Int {
        return 0
    }

    func part2() -> Int {
        return 0
    }
}


class Solution: SolutionProtocol {
    
    var puzzle = [String]()
    var id: Int = 0
    
    init() {
        puzzle = try! loadPuzzle()
    }
    

}
