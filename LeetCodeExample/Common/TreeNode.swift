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
    }
    
    public class func maxDepth(_ root: TreeNode?) -> Int {
        return root == nil ? 0 : max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
}
