//
//  TheDuplicateNumbersInArray.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/7/16.
//

import Foundation

class TheDuplicateNumbersInArray: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /**
         剑指 Offer 03. 数组中重复的数字
         找出数组中重复的数字。


         在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。

         示例 1：

         输入：
         [2, 3, 1, 0, 2, 5, 3]
         输出：2 或 3
        */
        
        self.title = "剑指 Offer 03. 数组中重复的数字"
        debugPrint("\(findRepeatNumber([2, 3, 1, 0, 2, 5, 3]))")
    }
    
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var _nums = nums
        return findRepear(&_nums)
    }
    
    func findRepear(_ nums: inout [Int]) -> Int {
        var result: Int?
        for (i,num) in nums.enumerated() {
            while num != i {
                let temp = nums[i]
                if nums[temp] == temp {
                    result = temp
                    break
                } else {
                    nums[i] = nums[temp]
                    nums[temp] = temp
                }
            }
        }
        return result ?? -1
    }
}
