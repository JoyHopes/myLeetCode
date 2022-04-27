//
//  SumOfTwoNumbers.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/17.
//

import Foundation

class SumOfTwoNumbers: LeetCodeBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "1. 两个数之和"
        print(fnAddTwoCount(10, [1,3,5,7,11]))
        // Do any additional setup after loading the view.
    }

    
    func fnAddTwoCount(_ targetNum: Int, _ numArray: [Int]) -> [Int] {
        var numsDic = [Int: Int]()
        var result = [Int]()
        for (i, num) in numArray.enumerated() {
            let needNum = targetNum - num
            print("num : \(num) needNum : \(needNum) numsDic == \(numsDic)")
            if let haveNum = numsDic[needNum] {
                result.append(haveNum)
                result.append(i)
                break
            } else {
                numsDic[num] = i
            }
        }
        
        return result
    }
}
