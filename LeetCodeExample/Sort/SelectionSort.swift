//
//  SelectionSort.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/4.
//

import Foundation

class SelectionSort: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "选择排序"
        
        var nums = [86, 39, 77, 23, 32, 45, 58, 63, 93, 4, 37, 22]
        
        fnSelectionSort(&nums)        
        debugPrint(nums)
    }
    
    // 选择排序
    func fnSelectionSort(_ array: inout [Int]) {
        for i in 0..<array.count {
            var minIndex = i
            for j in i..<array.count {
                if array[j] < array[minIndex] {
                    minIndex = j
                }
            }
            print("最小的数为：\(array[minIndex])")
            let temp = array[i]
            array[i] = array[minIndex]
            array[minIndex] = temp
            print(array)
            print("-----------------------------------------------")
        }
    }
}
