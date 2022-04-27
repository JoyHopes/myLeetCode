//
//  MyQueue.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/24.
//

import Foundation

class MyQueue {

    var inStack: [Int]
    var outStack: [Int]
    
    init() {
        inStack = []
        outStack = []
    }
    
    func push(_ x: Int) {
        inStack.append(x)
    }
    
    func pop() -> Int {
        configData()
        return outStack.isEmpty ? 0 : outStack.popLast()!
    }
    
    func peek() -> Int {
        configData()
        return outStack.isEmpty ? 0 : outStack.last!
    }
    
    func empty() -> Bool {
        return inStack.isEmpty && outStack.isEmpty
    }
    
    func configData() {
        if outStack.isEmpty {
            while !inStack.isEmpty {
                outStack.append(inStack.popLast()!)
            }
        }
    }
}
