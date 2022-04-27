//
//  ClimbStairs.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/17.
//

import Foundation

class ClimbStairs: LeetCodeBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "70. 爬楼梯"
        debugPrint(climbStairs(4))
        // Do any additional setup after loading the view.
    }


    func climbStairs(_ n: Int) -> Int {
        if n == 1 { return 1 }
        if n == 2 { return 1 }
        var sum = 0
        var index1 = 2
        var index2 = 1
        for _ in 3...n {
            sum = index1 + index2
            index2 = index1
            index1 = sum
        }
        return sum
    }
    
//    var indexDic = [String: Int]()
//    func climbStairs(_ n: Int) -> Int {
//        if n == 1 {
//            return 1
//        }
//
//        if n == 2 {
//            return 2
//        }
//
//        if let count = indexDic["\(n)"] {
//            return count
//        } else {
//            let count = climbStairs(n - 1) + climbStairs(n - 2)
//            indexDic["\(n)"] = count
//            return count
//        }
//    }
}
