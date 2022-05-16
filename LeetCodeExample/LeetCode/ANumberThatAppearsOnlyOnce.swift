//
//  ANumberThatAppearsOnlyOnce.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/13.
//

import Foundation

class ANumberThatAppearsOnlyOnce: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "136. 只出现一次的数字"
        
        let nums = [4,1,2,1,2]
        debugPrint(singleNumber(nums))
    }
    
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for number in nums {
            result = result ^ number
        }
        return result
    }
}
