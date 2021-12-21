//
//  Solution.swift
//  SwiftCommandLine
//
//  Created by EthanGuan on 2021/12/12.
//

import Foundation

class Solution {
    var puzzle = [String]()
    var id: Int { 0 }
    
    init() {
        puzzle = try! loadPuzzle()
    }
    
    func loadPuzzle() throws -> [String]  {
        let url = Bundle.main.url(forResource: "\(id)", withExtension: "")!
        let s = try String(contentsOf: url)
        return s.split(separator: "\n").map { String($0) }
    }
}
