//
//  AntecedentTraversalOfBinaryTrees.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/27.
//

import Foundation

class AntecedentTraversalOfBinaryTrees: LeetCodeBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "144. 二叉树的前序遍历"
        
        let tree1 = TreeNode(2, TreeNode(4), TreeNode(5))
        let tree2 = TreeNode(3, TreeNode(6), nil)
        let root = TreeNode(1, tree1, tree2)
        debugPrint(preorderTraversal(root))
    }
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var valList = [Int]()
//        var stackList = [TreeNode]()
//        var headRoot = root
//        while headRoot != nil || stackList.isEmpty == false {
//            while headRoot != nil {
//                valList.append(headRoot!.val)
//                stackList.append(headRoot!)
//                headRoot = headRoot?.left
//            }
//
//            headRoot = stackList.popLast()
//            headRoot = headRoot?.right
//        }
//        return valList
        accessTree(root, valList: &valList)
        return valList
    }
    
    public func accessTree(_ root: TreeNode?, valList: inout [Int]) {
        if root == nil { return }
        
        valList.append(root!.val)
        accessTree(root?.left, valList: &valList)
        accessTree(root?.right, valList: &valList)
    }
}
