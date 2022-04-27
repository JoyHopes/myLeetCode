//
//  TheMiddleNodeOfALinkedList.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/23.
//

import Foundation

class TheMiddleNodeOfALinkedList: LeetCodeBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "876. 链表的中间结点"
        let head = ListNode(1, ListNode(2, ListNode(3, ListNode(2, ListNode(1, ListNode(3))))))
        print(middleNode(head)?.val)
    }
    
    func middleNode(_ head: ListNode?) -> ListNode? {
        var fastNode = head
        var slowNode = head
        
        while fastNode != nil , fastNode?.next != nil {
            fastNode = fastNode?.next?.next
            slowNode = slowNode?.next
        }
        return slowNode
    }
}
