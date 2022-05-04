//
//  Qksort.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/4.
//

import Foundation

class Qksort: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "快速排序"
        
        var nums = [86, 39, 77, 23, 32, 45, 58, 63, 93, 4, 37, 22]
        quickSort(&nums, 0, nums.count - 1)
    }
    
    func quickSort(_ array: inout [Int], _ start: Int, _ end: Int) {
        if array.count < 1 || start < 0 || end >= array.count || start > end {
            return
        }
        
        let zoneIndex = partition(&array, start, end)
        if zoneIndex > start {
            quickSort(&array, start, zoneIndex - 1)
        }
        
        if zoneIndex < end {
            quickSort(&array, zoneIndex + 1, end)
        }
        
        print("本轮排序后的数组：")
        print(array, start, end)
        print("---------------------------------")
    }
    
    func partition(_ array: inout [Int], _ start: Int, _ end: Int) -> Int {
        if start == end {
            return start
        }
        
        // 随机选取一个基准数
        let pivot = start + Int(drand48() * Double(end - start + 1))
        var zoneIndex = start - 1
        print("开始下标：\(start), 结束下标：\(end), 基准数下标：\(pivot), 元素值：\(array[pivot]), 分区指示器：\(zoneIndex)")
        swap(&array, pivot, end)
        for i in start...end {
            if array[i] <= array[end] {
                zoneIndex += 1
                if i > zoneIndex {
                    swap(&array, i, zoneIndex)
                }
            }
            print("分区指示器：\(zoneIndex), 遍历指示器：\(i)")
            print(array, start, end)
        }
        print("-------------------------------")
        return zoneIndex
    }
    
    // 交换数组内2个元素
    func swap(_ array: inout [Int], _ i: Int, _ j: Int) {
        let temp = array[i]
        array[i] = array[j]
        array[j] = temp
    }
}
