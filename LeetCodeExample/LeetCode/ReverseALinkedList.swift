//
//  ReverseALinkedList.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/22.
//

import Foundation

class ReverseALinkedList: LeetCodeBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "206. 反转链表"
        
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        var preNode: ListNode? = nil
        var currNode = head
        while currNode != nil { 
            let next = currNode?.next
            currNode?.next = preNode
            preNode = currNode
            currNode = next
        }
        return preNode
    }
}
