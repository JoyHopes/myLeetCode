//
//  MiddleOrderTraversalOfBinaryTrees.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/26.
//

import Foundation

class MiddleOrderTraversalOfBinaryTrees: LeetCodeBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "94. 二叉树的中序遍历"
        
        let tree1 = TreeNode(2, TreeNode(4), TreeNode(5))
        let tree2 = TreeNode(3, TreeNode(6), nil)
        let root = TreeNode(1, tree1, tree2)
        debugPrint(inorderTraversal(root))
    }
    
//    func inorderTraversal(_ root: TreeNode?) -> [Int] {
//        var valList = [Int]()
//        var stackList = [TreeNode]()
//        var headRoot = root
//        while headRoot != nil || stackList.isEmpty == false {
//            while headRoot != nil {
//                stackList.append(headRoot!)
//                headRoot = headRoot?.left
//            }
//
//            headRoot = stackList.popLast()
//            valList.append(headRoot!.val)
//            headRoot = headRoot?.right
//        }
//        return valList
//    }
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var valList = [Int]()
        accessTree(root, valList: &valList)
        return valList
    }
    
    
    public func accessTree(_ root: TreeNode?, valList: inout [Int]) {
        if root == nil { return }
        
        accessTree(root?.left, valList: &valList)
        valList.append(root!.val)
        accessTree(root?.right, valList: &valList)
    }
}
