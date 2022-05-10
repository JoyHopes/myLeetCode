//
//  RadixSorting.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/10.
//

import Foundation

class RadixSorting: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "基数排序"
        
        let nums = [86, 39, 77, 23, 32, 45, 58, 63, 93, 4, 37, 22]
        debugPrint(fnRadixSorting(nums))
    }
    
    func fnRadixSorting(_ nums: [Int]) -> [Int] {
        var resultArr = nums
        if nums.count < 2 {
            return nums
        }
        
        // 找出最大数
        var max = nums[0]
        for number in nums where number > max {
            max = number
        }
        
        var maxDigit = 0
        while max != 0 {
            max /= 10
            maxDigit += 1
        }
        
        var mod = 10
        var div = 1
        var bucketList = [[Int]](repeating: [Int](), count: 10)
        
        // 按照从右往左的顺序，依次将每一位都当做依次关键字，然后按照该关键字对数组排序，每一轮排序都基于上一轮排序后的结果
        for i in 0..<maxDigit {
            print("----- 第\(i)轮排序 -----")
            // 遍历数组放入桶中
            for j in 0..<resultArr.count {
                let num = (resultArr[j] % mod) / div
                
                print("num = \(num) value = \(resultArr[j])")
                bucketList[num].append(resultArr[j])
            }
            
            // 看看桶中的分布
            for i in 0..<bucketList.count {
                print("第\(i)个桶包含数据：\(bucketList[i])")
            }
            
            // 将桶中的数据写回原数组，清楚桶，准备下一轮排序
            var index = 0
            for i in 0..<bucketList.count {
                for j in 0..<bucketList[i].count {
                    resultArr[index] = bucketList[i][j]
                    index += 1
                }
                bucketList[i].removeAll()
            }
            
            mod *= 10
            div *= 10
        }
        
        return resultArr
    }
}
