//
//  OrderByMerging.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/6.
//

import Foundation

class OrderByMerging: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "归并排序"
        
        let nums = [86, 39, 77, 23, 32, 45, 58, 63, 93, 4, 37, 22]
        fnOrderByMerging(nums)
    }
    
    @discardableResult
    func fnOrderByMerging(_ nums: [Int]) -> [Int] {
        if nums.count < 2 {
            return nums
        }
        // 切分数组 然后递归排序 并用merge合并
        let mid = nums.count / 2
        let left = fnGetArray(nums, 0, mid)
        let right = fnGetArray(nums, mid, nums.count)
        return fnMergeArray(fnOrderByMerging(left), fnOrderByMerging(right))
    }
    
    func fnGetArray(_ nums: [Int], _ from: Int, _ end: Int) -> [Int] {
        var result = [Int]()
        for i in from..<end {
            result.append(nums[i])
        }
        return result
    }
    
    func fnMergeArray(_ left: [Int], _ right: [Int]) -> [Int] {
        let len = left.count + right.count
        var result = [Int](repeating: 0, count: len)
        var i = 0
        var j = 0
        for index in 0..<len {
            if i >= left.count { // 左边数组已经取完，完全取右边数组的值即可
                result[index] = right[j]
                j += 1
            } else if j >= right.count { // 右边数组已经取完，完全取左边数组的值即可
                result[index] = left[i]
                i += 1
            } else if left[i] > right[j] { // 左边数组的元素值大于右边数组， 取右边数组的值
                result[index] = right[j]
                j += 1
            } else { // 右边数组的元素值大于左边数组，取左边数组的值
                result[index] = left[i]
                i += 1
            }
        }
        
        debugPrint("左子数组：\(left)")
        debugPrint("右子数组：\(right)")
        debugPrint("合并后数组：\(result)")
        return result
    }
}
