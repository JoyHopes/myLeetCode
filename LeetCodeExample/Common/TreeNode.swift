//
//  TreeNode.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/26.
//

import Foundation

public class TreeNode {
    
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    public func log(_ level: Int = 0, _ depth: Int) {
        print("aaa === \(self.val)")
//        
//        if self.left == nil, self.right != nil {
//            print("aaa === null")
//            print("aaa === null")
//            self.right?.log(level+1, depth)
//        } else if self.left != nil, self.right == nil {
//            self.left?.log(level+1, depth)
//            print("aaa === null")
//            print("aaa === null")
//        } else if self.left == nil, self.right == nil, level < depth {
//            print("aaa === null")
//            print("aaa === null")
//        } else {
//            self.left?.log(level+1, depth)
//            self.right?.log(level+1, depth)
//        }
    }
    
    public class func maxDepth(_ root: TreeNode?) -> Int {
        return root == nil ? 0 : max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
}
