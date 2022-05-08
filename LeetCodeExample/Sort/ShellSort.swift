//
//  ShellSort.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/6.
//

import Foundation

class ShellSort: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "希尔排序"
        
        var nums = [86, 39, 77, 23, 32, 45, 58, 63, 93, 4, 37, 22]
        sortArray(&nums)
//        debugPrint(nums)
    }
    
    func sortArray(_ nums: inout [Int]) {
        let len = nums.count
        var currentValue = 0
        var gap = len / 2
        while gap > 0 {
            for i in gap..<len {
                currentValue = nums[i]
                var preIndex = i - gap
                
                print("i = \(i) preIndex = \(preIndex) currentValue = \(currentValue)")
                while preIndex >= 0, nums[preIndex] > currentValue {
                    print("preIndex = \(preIndex) preIndex + gap = \(preIndex + gap) nums[preIndex] = \(nums[preIndex])")
                    nums[preIndex + gap] = nums[preIndex]
                    preIndex -= gap
                }
                
                nums[preIndex + gap] = currentValue
            }
            
            print("本轮增量【\(gap)】排序后的数组：")
            print(nums)
            gap = gap/2
        }
    }
}
