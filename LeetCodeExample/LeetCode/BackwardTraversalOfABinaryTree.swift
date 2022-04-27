//
//  BackwardTraversalOfABinaryTree.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/28.
//

import Foundation


class BackwardTraversalOfABinaryTree: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "145. 二叉树的后序遍历"
        
        let tree1 = TreeNode(2, TreeNode(4), TreeNode(5))
        let tree2 = TreeNode(3, TreeNode(6), nil)
        let root = TreeNode(1, tree1, tree2)
        debugPrint(postorderTraversal(root))
    }
    
//    func postorderTraversal(_ root: TreeNode?) -> [Int] {
//        var valList: [Int] = [Int]()
//        var nodeStack: [TreeNode] = [TreeNode]()
//        var preNode: TreeNode? = nil
//        var head = root
//        while head != nil || nodeStack.isEmpty == false {
//            while head != nil {
//                nodeStack.append(head!)
//                head = head?.left
//            }
//
//            head = nodeStack.popLast()
//            if head?.right == nil || head?.right === preNode {
//                valList.append(head!.val)
//                preNode = head
//                head = nil
//            } else {
//                nodeStack.append(head!)
//                head = head?.right
//            }
//
//        }
//
//        return valList
//    }
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var valList: [Int] = [Int]()
        accessTree(root, valList: &valList)
        return valList
    }
    
    public func accessTree(_ root: TreeNode?, valList: inout [Int]) {
        if root == nil { return }
        accessTree(root?.left, valList: &valList)
        accessTree(root?.right, valList: &valList)
        valList.append(root!.val)
    }
}
