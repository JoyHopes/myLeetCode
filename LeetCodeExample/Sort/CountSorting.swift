//
//  CountSorting.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/8.
//

import Foundation

class CountSorting: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "计数排序"
        
        var nums = [5,4,5,0,3,6,2,0,2,4,3,3]
        fnCountSorting(&nums)
    }
    
    func fnCountSorting(_ nums: inout [Int]) {
        if nums.count == 0 {
            return
        }
        
        var min = nums[0]
        var max = nums[0]
        var bias = 0
        for number in nums {
            if number > max {
                max = number
            }
            
            if number < min {
                min = number
            }
        }
        
        bias = 0 - min
        
        var counterArray = [Int](repeating: 0, count: max - min + 1)
        for number in nums {
            counterArray[number + bias] += 1
        }
        
        print("计数数组为：\(counterArray)")
        var index = 0
        var i = 0
        while index < nums.count {
            if counterArray[i] != 0 {
                nums[index] = i - bias
                counterArray[i] -= 1
                index += 1
            } else {
                i += 1
            }
            
            print("当前轮循环结束计数数组为：\(counterArray)")
            print("当前轮循环结束排序数组为：\(nums)")
        }
    }
}
