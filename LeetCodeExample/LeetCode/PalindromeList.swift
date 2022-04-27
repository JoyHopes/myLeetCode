//
//  PalindromeList.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/22.
//

import Foundation

class PalindromeList: LeetCodeBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "234. 回文链表"
        
        let head = ListNode(1, ListNode(2, ListNode(3, ListNode(2, ListNode(1, ListNode(3))))))
        print(isPalindrome(head))
    }
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil { return false }
        var fastNode = head
        var slowNode = head
        
        while fastNode != nil, fastNode?.next != nil {
            fastNode = fastNode?.next?.next
            slowNode = slowNode?.next
        }
        
        if fastNode != nil {
            slowNode = slowNode?.next
        }
        
        fastNode = head
        slowNode = reverseList(slowNode)
        
        while slowNode != nil {
            print("slow = \(slowNode!.val) fast = \(fastNode!.val)")
            if slowNode!.val != fastNode!.val {
                return false
            }
            fastNode = fastNode?.next
            slowNode = slowNode?.next
        }
        
        return true
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
