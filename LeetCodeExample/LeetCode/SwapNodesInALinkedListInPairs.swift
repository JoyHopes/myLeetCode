//
//  SwapNodesInALinkedListInPairs.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/2.
//

import Foundation

class SwapNodesInALinkedListInPairs: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "24. 两两交换链表中的节点"
        

        let head = ListNode(1, ListNode(2, ListNode(3, ListNode(4))))
        var result = swapPairs(head)
        ListNode.printNode(&result)
    }
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let next = head?.next
        head?.next = swapPairs(next?.next)
        next?.next = head
        return next
    }
}
