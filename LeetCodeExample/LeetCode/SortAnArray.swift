//
//  SortAnArray.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/3.
//

import Foundation

class SortAnArray: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "912. 排序数组"
        
        let nums = [5,1,1,2,0,0]
        debugPrint(sortArray(nums))
    }
    
    func sortArray(_ nums: [Int]) -> [Int] {
        var myNums = nums
        for i in 0..<myNums.count {
            for j in 0..<myNums.count-i-1 {
                if myNums[j+1] < myNums[j] {
                    let temp = myNums[j]
                    myNums[j] = myNums[j+1]
                    myNums[j+1] = temp
                }
            }
        }
        return myNums
    }
    
//    func sortArray(_ nums: [Int]) -> [Int] {
//        return nums.sorted()
//    }
}
