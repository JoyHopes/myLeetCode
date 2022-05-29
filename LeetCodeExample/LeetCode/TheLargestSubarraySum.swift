//
//  TheLargestSubarraySum.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/29.
//

import Foundation

class TheLargestSubarraySum: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         53. 最大子数组和
         给你一个整数数组 nums ，请你找出一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

         子数组 是数组中的一个连续部分。

          

         示例 1：

         输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
         输出：6
         解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。
         示例 2：

         输入：nums = [1]
         输出：1
         示例 3：

         输入：nums = [5,4,-1,7,8]
         输出：23
         **/
        
        self.title = "53. 最大子数组和"
        
        let nums = [-2,1,-3,4,-1,2,1,-5,4]
        debugPrint(maxSubArray(nums))
    }
    
    
//    // 动态规划
//    // 状态转移公式 dp[i] = max(nums[i], (dp[i - 1] + nums[i]))
//    // dp[i]的定义：包含下标i之前的最大连续子序列和
//    func maxSubArray(_ nums: [Int]) -> Int {
//        var dp = [Int](repeating: nums[0], count: nums.count)
//        var result = nums[0]
//        for i in 1..<nums.count {
//            dp[i] = max(dp[i - 1] + nums[i], nums[i])
//            if dp[i] > result {
//                result = dp[i]
//            }
//        }
//        debugPrint(dp)
//        return result
//    }
    
    // 不需要额外空间的算法
    func maxSubArray(_ nums: [Int]) -> Int {
        var result = nums[0]
        var pre = nums[0]
        for i in 1..<nums.count {
            pre = max(pre + nums[i], nums[i])
            if pre > result {
                result = pre
            }
        }
        return result
    }
}
