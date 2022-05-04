//
//  InsertionSorting.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/4.
//

import Foundation

class InsertionSorting: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "插入排序"
        
        var nums = [86, 39, 77, 23, 32, 45, 58, 63, 93, 4, 37, 22]
        fnInsertionSorting(&nums)
        debugPrint(nums)
    }
    
    // 插入排序
    func fnInsertionSorting(_ array: inout [Int]) {
        var currentValue = 0 // 待排序的索引
        for i in 0..<array.count-1 {
            var preIndex = i // 已排序的索引
            currentValue = array[preIndex+1]
            
            print("待排序索引：\(i+1), 值为\(currentValue), 已排序的索引：\(preIndex)")
            
            // 从已排序的数组中找到应该插入的位置，直到当前数据比已排序的最大值都大
            while preIndex >= 0, currentValue < array[preIndex] {
                array[preIndex+1] = array[preIndex]
                preIndex -= 1
                print(array)
            }
            
            // while循环结束，说明已经找到待插入的位置
            array[preIndex+1] = currentValue
            print("插入排序后：\(array)")
        }
    }
}
