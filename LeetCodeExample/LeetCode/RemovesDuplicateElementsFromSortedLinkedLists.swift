//
//  RemovesDuplicateElementsFromSortedLinkedLists.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/18.
//

import Foundation

//class ListNodeModel {
//    var title: String
//    var node: ListNodeModel?
//    
//    public init() {
//        self.title = ""
//        self.node = nil
//    }
//    
//    public init(title: String) {
//        self.title = title
//        self.node = nil
//    }
//    
//    public init(title: String, node: ListNodeModel?) {
//        self.title = title
//        self.node = node
//    }
//}

class RemovesDuplicateElementsFromSortedLinkedLists: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "83. 删除排序链表中的重复元素"
        
        let listNode = ListNode(1, ListNode(1, ListNode(2, ListNode(2, ListNode(4)))))
        var node = deleteDuplicates(listNode)
        ListNode.printNode(&node)
        
//        let model = ListNodeModel(title: "111", node: ListNodeModel(title: "123"))
//        var model1 = model
//
//        model1.title = "222"
    }
    
    /**
     ////////////////////////////////////////////////////////////////
     //MARK:-
     //MARK:array1 不会随着 arr2的改变而改变
     //MARK:-
     ////////////////////////////////////////////////////////////////
     let array1 = [1,2,3,4,5]
     var arr2 = array1
     
     arr2.remove(at: 0)
*/
    
//    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
//        if head == nil {
//            return head
//        }
//        var currentNode = head
//        while currentNode?.next != nil {
//            if currentNode!.val == currentNode!.next!.val {
//                currentNode?.next = currentNode?.next?.next
//            } else {
//                currentNode = currentNode?.next
//            }
//        }
//        return head
//    }
    
    // 递归
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        head?.next = deleteDuplicates(head?.next)
        return head!.val == head!.next!.val ? head?.next : head
    }
}
