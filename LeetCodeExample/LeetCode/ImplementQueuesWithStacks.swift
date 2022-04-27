//
//  ImplementQueuesWithStacks.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/24.
//

import Foundation

class ImplementQueuesWithStacks: LeetCodeBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "232. 用栈实现队列"
        
        let obj = MyQueue()
        obj.push(2)
        obj.push(3)
        let ret_2: Int = obj.pop()
        obj.pop()
        let ret_3: Int = obj.peek()
        obj.pop()
        let ret_4: Bool = obj.empty()
        
        debugPrint("ret_2 = \(ret_2)  ret_3 = \(ret_3)  ret_4 = \(ret_4)")
    }
}
