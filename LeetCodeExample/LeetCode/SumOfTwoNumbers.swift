//
//  SumOfTwoNumbers.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/17.
//

import Foundation

class SumOfTwoNumbers: LeetCodeBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         1. 两数之和
         给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

         你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

         你可以按任意顺序返回答案。

          
         示例 1：
         输入：nums = [2,7,11,15], target = 9
         输出：[0,1]
         解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。
         示例 2：

         输入：nums = [3,2,4], target = 6
         输出：[1,2]
         示例 3：

         输入：nums = [3,3], target = 6
         输出：[0,1]
         **/
        self.title = "1. 两个数之和"
        print(fnAddTwoCount(10, [1,3,5,7,11]))
        print(twoSum([3,2,4], 6))
        // Do any additional setup after loading the view.
    }
    
    // 真矬的方法
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var resultIndexs = [Int]()
        var numDict = [Int: Int]()
        for i in 0..<nums.count {
            numDict[i] = nums[i]
        }
        
        for i in 0..<nums.count {
            let nextCount = target - nums[i]
            for (index, value) in numDict {
                if nextCount == value, index != i {
                    resultIndexs.append(i)
                    resultIndexs.append(index)
                }
            }
            
            if resultIndexs.count > 0 {
                break
            }
        }
        return resultIndexs
    }
 
    func fnAddTwoCount(_ targetNum: Int, _ numArray: [Int]) -> [Int] {
        var numsDic = [Int: Int]()
        var result = [Int]()
        for (i, num) in numArray.enumerated() {
            let needNum = targetNum - num
            print("num : \(num) needNum : \(needNum) numsDic == \(numsDic)")
            if let haveNum = numsDic[needNum] {
                result.append(haveNum)
                result.append(i)
                break
            } else {
                numsDic[num] = i
            }
        }

        return result
    }
}
