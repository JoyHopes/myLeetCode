//
//  ListNode.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/18.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    static func printNode(_ node: inout ListNode?) {
        while node?.next != nil {
            print("node == \(node?.val ?? 0)")
            node = node?.next
        }
        print("node == \(node?.val ?? 0)")
    }
}
