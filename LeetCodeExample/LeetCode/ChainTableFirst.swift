//
//  ChainTableFirst.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/20.
//

import Foundation

class ChainTableFirst: LeetCodeBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "141. 环链表1"
        
        var list1 = ListNode(1)
        var list2 = ListNode(1)
//        var list3 = ListNode(4)
//        var list4 = ListNode(8)
        list1.next = list2
//        list2.next = list3
//        list3.next = list4
//        list4.next = list2
        
        print("\(hasCycle(list1))")
//        ListNode.printNode(&list1)
    }
    
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil {
            return false
        }
        
        var ptr = head
        var isHaveCycle = false
        var map = [String: Int]()
        
        while ptr?.next != nil, isHaveCycle == false {
            let next = ptr!.next
            let val = ptr!.val
            
            if let next = next {
                let str = Unmanaged<ListNode>.passUnretained(next).toOpaque()
                let key = String(describing: str)
                if map[key] == nil {
                    map[key] = val
                    ptr = ptr?.next
                } else {
                    let node = map[key]
                    if node == ptr!.val {
                        isHaveCycle = true
                    } else {
                        if let _next = ptr?.next {
                            let str1 = Unmanaged<ListNode>.passUnretained(_next).toOpaque()
                            let key1 = String(describing: str1)
                            map[key1] = ptr!.val
                            ptr = ptr?.next
                        }
                    }
                }
            }
        }
        
        return  isHaveCycle
    }
}
