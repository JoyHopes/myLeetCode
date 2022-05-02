//
//  FlipTheBinaryTree.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/2.
//

import Foundation

class FlipTheBinaryTree: LeetCodeBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "226. 翻转二叉树"
        
        let tree1 = TreeNode(2, TreeNode(3), TreeNode(4, TreeNode(2, TreeNode(1), nil), nil))
        let tree2 = TreeNode(1, TreeNode(2), TreeNode(4))
        tree1.log(0, TreeNode.maxDepth(tree1))

//        debugPrint(invertTree(TreeNode(1, tree1, tree2)))
        let result = invertTree(TreeNode(1, tree1, tree2))
        
    }
    
    @discardableResult
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        invertTree(root?.left)
        invertTree(root?.right)
        let temp = root?.left
        root?.left = root?.right
        root?.right = temp
        return root
    }
}
