//
//  MergesTwoOrderedArrays.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/17.
//

import Foundation

class MergesTwoOrderedArrays: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "88. 合并2个有序数组"
        
        var nums1 = [1,3,5,6,7,9,0,0,0,0]
        let nums2 = [2,5,8,10]
        
        merge(&nums1, 6, nums2, 4)
        print(nums1)
        // Do any additional setup after loading the view.
    }

    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
//        let count = m + n
//        var num1Index = 0
//        var num2Index = 0
//        var maxNums = [Int]()
//        for _ in 0..<count {
//            if num1Index >= m {
//                maxNums.append(nums2[num2Index])
//                num2Index += 1
//            } else if num2Index >= n {
//                maxNums.append(nums1[num1Index])
//                num1Index += 1
//            } else if nums1[num1Index] < nums2[num2Index] {
//                maxNums.append(nums1[num1Index])
//                num1Index += 1
//            } else {
//                maxNums.append(nums2[num2Index])
//                num2Index += 1
//            }
//        }
//        nums1 = maxNums
        
        let k = m + n
        var index1 = m - 1
        var index2 = n - 1
        for i in stride(from: k-1, through: 0, by: -1) {
            if index1 < 0 {
                nums1[i] = nums2[index2]
                index2 -= 1
            } else if index2 < 0 {
                nums1[i] = nums1[index1]
                index1 -= 1
            } else if nums1[index1] < nums2[index2] {
                nums1[i] = nums2[index2]
                index2 -= 1
            } else {
                nums1[i] = nums1[index1]
                index1 -= 1
            }
        }
    }
}
