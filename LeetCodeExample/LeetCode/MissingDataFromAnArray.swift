//
//  MissingDataFromAnArray.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/17.
//

import Foundation
import UIKit

class MissingDataFromAnArray: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = " 448. 找到所有数组中消失的数字"
        
        var nums = [4,3,2,7,8,2,3,1]
        let resultNums = findDisappearedNumbers(&nums)
        
        print(resultNums)
    }
    
    func findDisappearedNumbers(_ nums: inout [Int]) -> [Int] {
        var resultNums = [Int]()

        for num in nums {
            if nums[num - 1] < 0 {
                continue
            }
            let result = -nums[num-1]
            nums[num-1] = result
        }
            
        for (i, num) in nums.enumerated() {
            if num > 0 {
                resultNums.append(i+1)
            }
        }
        
        return resultNums
    }
    
    
//    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
//        var resultNums = [Int]()
//        var resultDict = [Int: Int]()
//        for (i, num) in nums.enumerated() {
//            resultDict[num] = i
//        }
//
//        for i in 1...nums.count {
//            if resultDict[i] == nil {
//                resultNums.append(i)
//            }
//        }
//
//        return resultNums
//    }


//    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
//        var resultNums = [Int]()
//        for i in 1...nums.count {
//            if nums.contains(i) == false {
//                resultNums.append(i)
//            }
//        }
//        return resultNums
//    }
}
