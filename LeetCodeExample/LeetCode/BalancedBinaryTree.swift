//
//  BalancedBinaryTree.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/1.
//

import Foundation

class BalancedBinaryTree: LeetCodeBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "110. 平衡二叉树"
        
        let tree1 = TreeNode(2, TreeNode(3), TreeNode(4, TreeNode(2, TreeNode(1), nil), nil))
        let tree2 = TreeNode(1, TreeNode(2), TreeNode(4))
        debugPrint(isBalanced(TreeNode(1, tree1, tree2)))
    }
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        return calNoteDepth(root) != -1
    }
    
    func calNoteDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let leftDepth = calNoteDepth(root?.left)
        let rightDepth = calNoteDepth(root?.right)
        if leftDepth == -1 || rightDepth == -1 || abs(leftDepth - rightDepth) > 1 {
            return -1
        }
        return max(leftDepth, rightDepth) + 1
    }
}
