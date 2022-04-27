//
//  ChainTableSecond.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/20.
//

import Foundation

class ChainTableSecond: LeetCodeBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "141. 环链表2"
    }
    
    func detectCycle(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var slowPtr = head
        var fastPtr = head
        var isLoop = false
        while slowPtr?.next != nil, fastPtr?.next?.next != nil {
            slowPtr = slowPtr?.next
            fastPtr = fastPtr?.next?.next
            if slowPtr === fastPtr {
                isLoop = true
                break
            }
        }
        
        if isLoop {
            slowPtr = head
            while slowPtr !== fastPtr {
                slowPtr = slowPtr?.next
                fastPtr = fastPtr?.next
            }
            return slowPtr
        }
        
        return nil
    }
}
