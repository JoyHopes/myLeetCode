//
//  CrossLinkedList.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/21.
//

import Foundation

class CrossLinkedList: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "160. 相交链表"
        
    }
    
//    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
//        var ptrA = headA
//        var ptrB = headB
//        while (ptrA === ptrB) == false {
//            ptrA = ptrA == nil ? ptrB : ptrA?.next
//            ptrB = ptrB == nil ? ptrA : ptrB?.next
//        }
//        return ptrA
//    }
    
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
            return nil
        }
        var ptr1 = headA
        var ptr2 = headB
        var countA = 0
        var countB = 0
        while ptr1 != nil {
            ptr1 = ptr1?.next
            countA += 1
        }
        
        while ptr2 != nil {
            ptr2 = ptr2?.next
            countB += 1
        }
        print("A = \(countA) B == \(countB)")

        let diff = abs(countA - countB)
        ptr1 = countA > countB ? headA : headB
        ptr2 = countA > countB ? headB : headA

        var count = 0
        // , count != diff
        while ptr1 != nil {
            ptr1 = ptr1?.next
            count += 1
            print("\(count) diff == \(diff)")
            if count == diff {
                break
            }
        }

        while ptr1 !== ptr2 {
            ptr1 = ptr1?.next
            ptr2 = ptr2?.next
        }
        return ptr1
    }
}
