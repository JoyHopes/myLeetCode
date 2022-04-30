//
//  TheMaximumDepthOfABinaryTree.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/30.
//

import Foundation

class TheMaximumDepthOfABinaryTree: LeetCodeBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "104. 二叉树的最大深度"
        
//        let tree1 = TreeNode(2, TreeNode(3), TreeNode(4, TreeNode(2, TreeNode(1), nil), nil))
//        let tree2 = TreeNode(1, TreeNode(2), TreeNode(4))

        let tree1 = TreeNode(2, TreeNode(4), nil)
        let tree2 = TreeNode(3, nil, TreeNode(5))

        print("\(maxDepth(TreeNode(1, tree1, tree2)))")
    }
    
//    // 递归
//    func maxDepth(_ root: TreeNode?) -> Int {
//        if root == nil {
//            return 0
//        }
//
//        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
//    }
    
    var depth = 0
    // 前序遍历
    func maxDepth(_ root: TreeNode?) -> Int {
        calNode(root, 1)
        return depth
    }
    
    func calNode(_ root: TreeNode?, _ level: Int) {
        if root == nil {
            return
        }
        
        if root?.left == nil, root?.right == nil {
            depth = max(depth, level)
        }
        
        calNode(root?.left, level+1)
        calNode(root?.right, level+1)
    }
    
//    // 队列
//    func maxDepth(_ root: TreeNode?) -> Int {
//        if root == nil {
//            return 0
//        }
//
//        var trees = [TreeNode]()
//        trees.append(root!)
//        var depth = 0
//        while trees.isEmpty == false {
//            // size记录同一层级的节点是否处理结束
//            var size = trees.count
//            print("当前层级的节点个数：\(size)")
//            while size > 0 {
//                let node = trees.removeFirst()
//                if node.left != nil {
//                    trees.append(node.left!)
//                }
//
//                if node.right != nil {
//                    trees.append(node.right!)
//                }
//                size -= 1
//            }
//            depth += 1
//        }
//        return depth
//    }
}
