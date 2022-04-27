//
//  MobileZero.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/17.
//

import Foundation

class MobileZero: LeetCodeBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "283.移动零"
        
        var nums = [0,1,0,3,12]
        moveZeroes(&nums)
        
        print(nums)
        // Do any additional setup after loading the view.
    }

    func moveZeroes(_ nums: inout [Int]) {
        var yIndex = 0
        for num in nums {
            if num != 0 {
                nums[yIndex] = num
                yIndex += 1
            }
        }
        
        for i in stride(from: yIndex, through: nums.count - 1, by: 1) {
            nums[i] = 0
        }
    }
}
