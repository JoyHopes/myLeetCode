//
//  MergesTwoOrderedLists.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/17.
//

import Foundation

class MergesTwoOrderedLists: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "21. 合并2个有序链表"
        
        let list1 = ListNode(1, ListNode(2, ListNode(4)))
        let list2 = ListNode(1, ListNode(3, ListNode(4)))
        
        var node = mergeTwoLists(list1, list2)
        ListNode.printNode(&node)
    }
    
//    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//
//        if list1 == nil { return list2 }
//        if list2 == nil { return list1 }
//
//        let resultNode: ListNode? = ListNode()
//        var retLast = resultNode
//        var myList1 = list1
//        var myList2 = list2
//        while myList1 != nil, myList2 != nil {
//            if myList1!.val <= myList2!.val {
//                retLast?.next = myList1
//                myList1 = myList1?.next
//            } else {
//                retLast?.next = myList2
//                myList2 = myList2?.next
//            }
//            retLast = retLast?.next
//        }
//
//        if myList1 != nil {
//            retLast?.next = myList1
//        }
//
//        if myList2 != nil {
//            retLast?.next = myList2
//        }
//
//        return resultNode?.next
//    }

    // 递归
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }
        
        if list2 == nil {
            return list1
        }
        
        if list1!.val < list2!.val {
            list1?.next = mergeTwoLists(list1?.next, list2)
            return list1
        }
        list2?.next = mergeTwoLists(list1, list2?.next)
        return list2
    }
    
    
//    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//        if list1 == nil {
//            return list2
//        }
//        if list2 == nil {
//            return list1
//        }
//
//        let retHead: ListNode? = ListNode()
//        var retLast = retHead
//        var current1 = list1
//        var current2 = list2
//        while (current1 != nil && current2 != nil) {
//            if (current1!.val <= current2!.val) {
//                retLast?.next = current1
//                current1 = current1?.next
//            } else {
//                retLast?.next = current2
//                current2 = current2?.next
//            }
//            retLast = retLast?.next
//        }
//
//        retLast?.next = current1 == nil ? current2 : current1
//        return retHead
//    }
    
//    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//        if list1 == nil {
//            return list2
//        }
//        if list2 == nil {
//            return list1
//        }
//
//        var current1 = list1
//        var current2 = list2
//        var toInsertPre: ListNode?
//        var toInsertBeg: ListNode?
//        var toInsertEnd: ListNode?
//
//        var retHead = list1
//
//        while current1 != nil && current2 != nil {
//            if current1!.val <= current2!.val {
//                if toInsertBeg != nil {
//                    if toInsertPre == nil {
//                        toInsertEnd?.next = current1
//                        retHead = toInsertBeg
//                    } else {
//                        toInsertEnd?.next = toInsertPre?.next
//                        toInsertPre?.next = toInsertBeg
//                    }
//                    toInsertBeg = nil
//                    toInsertEnd = nil
//                }
//                toInsertPre = current1
//                current1 = current1?.next
//            } else {
//                if toInsertBeg == nil {
//                    toInsertBeg = current2
//                    toInsertEnd = current2
//                } else {
//                    toInsertEnd = toInsertEnd?.next
//                }
//                current2 = current2?.next
//            }
//        }
//
//        if current1 === list1 {
//            toInsertEnd?.next = current1
//            return toInsertBeg
//        }
//
//        if current2 === list2 {
//            toInsertPre?.next = current2
//            return retHead
//        }
//
//        if current1 == nil {
//            toInsertPre?.next = current2
//        } else {
//            toInsertPre?.next = toInsertBeg
//            toInsertEnd?.next = current1
//        }
//        return retHead
//    }

}
