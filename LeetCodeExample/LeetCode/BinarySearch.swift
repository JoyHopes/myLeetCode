//
//  BinarySearch.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/4.
//

import Foundation

class BinarySearch: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "704. 二分查找"
        
        let nums = [4, 22, 32, 45, 78, 99]
        debugPrint(search(nums, 32))
    }
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        return searchName(nums, 0, nums.count - 1, target)
    }
    
    func searchName(_ nums: [Int], _ start: Int, _ end: Int, _ target: Int) -> Int {
        let mid = (start + end) / 2
        
        if start <= end {
            if target > nums[mid] {
                return searchName(nums, mid + 1, end, target)
            } else if target < nums[mid] {
                return searchName(nums, start, mid - 1, target)
            } else {
                return mid
            }
        } else {
            return -1
        }
    }
    
//    func search(_ nums: [Int], _ target: Int) -> Int {
//        var start = 0
//        var end = nums.count - 1
//        while start <= end {
//            let mid: Int = (start + end)/2
//            if target > nums[mid] {
//                start = mid + 1
//            } else if target < nums[mid] {
//                end = mid - 1
//            } else {
//                return mid
//            }
//        }
//        return -1
//    }
}
