//
//  BubbleSort.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/3.
//

import Foundation

class BubbleSort: LeetCodeBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "冒泡排序"
        
        var nums = [86, 39, 77, 23, 32, 45, 58, 63, 93, 4, 37, 22]        
        fnBubbleSort(&nums)
        debugPrint(nums)
    }
    
    // 冒泡排序
    func fnBubbleSort(_ array: inout [Int]) {
        for i in 0..<array.count {
            print("aaaa == \(array[i])")
            // array.count-1-i 以后的位置已经排好序了 无需再次比较
            for j in 0..<array.count-1-i {
                if array[j+1] < array[j] {
                    let temp = array[j+1]
                    array[j+1] = array[j]
                    array[j] = temp
                }
                print(array)
            }
            print("-----------------------------------------------")
        }
    }
}
