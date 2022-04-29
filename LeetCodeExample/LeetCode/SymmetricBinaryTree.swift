//
//  SymmetricBinaryTree.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/29.
//

import Foundation

class SymmetricBinaryTree: LeetCodeBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "101. 对称二叉树"
        
        
        let tree1 = TreeNode(2, TreeNode(3), TreeNode(4))
        let tree2 = TreeNode(2, TreeNode(4), TreeNode(3))
        
        print("\(isSymmetric(TreeNode(1, tree1, tree2)))")
    }
    
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        let left = root?.left
        let right = root?.right
        var trees = [TreeNode]()
        if root == nil || (left == nil && right == nil) {
            return true
        }
        
        trees.append(left!)
        trees.append(right!)
        
        while trees.isEmpty == false {
            let node1 = trees.popLast()
            let node2 = trees.popLast()
                    
            if node1!.val != node2!.val {
                return false
            }
            
            if node1?.left != nil && node2?.right != nil {
                trees.append(node1!.left!)
                trees.append(node2!.right!)
            } else if node1?.left == nil && node2?.right == nil  {
                
            } else {
                return false
            }
            
            if node1?.right != nil && node2?.left != nil {
                trees.append(node1!.right!)
                trees.append(node2!.left!)
            } else if node1?.right == nil && node2?.left == nil  {

            } else {
                return false
            }
        }
        
        return true
    }
    
//    func isSymmetric(_ root: TreeNode?) -> Bool {
//
//        if root == nil {
//            return true
//        }
//
//        return deepCheck(root?.left, root?.right)
//    }
//
//
//    public func deepCheck(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
//        if left == nil, right == nil {
//            return true
//        }
//
//        if left == nil || right == nil {
//            return false
//        }
//
//        if left!.val != right!.val {
//            return false
//        }
//
//        return deepCheck(left?.left, right?.right) && deepCheck(left?.right, right?.left)
//    }
}
