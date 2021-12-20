//
//  Solution.swift
//  SwiftCommandLine
//
//  Created by EthanGuan on 2021/12/12.
//

import Foundation

protocol SolutionProtocol {
    func getID() -> Int
    var puzzle: [String] { get set }
    func part1() -> Int
    func part2() -> Int
    func loadPuzzle() throws -> [String]
}

extension SolutionProtocol {
    func loadPuzzle() throws -> [String]  {
        let id = getID()
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
    func getID() -> Int { 0 }
    var puzzle = [String]()
    init() {
        puzzle = try! loadPuzzle()
    }
}
