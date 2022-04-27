//
//  TheKthLastNodeInALinkedList.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/24.
//

import Foundation

class TheKthLastNodeInALinkedList: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "剑指 Offer 22. 链表中倒数第k个节点"
        
        let head = ListNode(1, ListNode(2, ListNode(3, ListNode(2, ListNode(1, ListNode(3))))))
        var res = getKthFromEnd(head, 3)
        ListNode.printNode(&res)
    }
    
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        if k == 0 {
            return nil
        }
        
        let diff = k - 1
        var fastNode = head
        var slowNode = head
        for _ in 0..<diff {
            fastNode = fastNode?.next
        }
        
        while fastNode?.next != nil {
            fastNode = fastNode?.next
            slowNode = slowNode?.next
        }
        
        return slowNode
    }
}
