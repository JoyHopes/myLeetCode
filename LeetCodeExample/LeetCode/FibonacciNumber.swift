//
//  FibonacciNumber.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/29.
//

import Foundation

class FibonacciNumber: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         509. 斐波那契数
         斐波那契数 （通常用 F(n) 表示）形成的序列称为 斐波那契数列 。该数列由 0 和 1 开始，后面的每一项数字都是前面两项数字的和。也就是：

         F(0) = 0，F(1) = 1
         F(n) = F(n - 1) + F(n - 2)，其中 n > 1
         给定 n ，请计算 F(n) 。

          

         示例 1：

         输入：n = 2
         输出：1
         解释：F(2) = F(1) + F(0) = 1 + 0 = 1
         示例 2：

         输入：n = 3
         输出：2
         解释：F(3) = F(2) + F(1) = 1 + 1 = 2
         示例 3：

         输入：n = 4
         输出：3
         解释：F(4) = F(3) + F(2) = 2 + 1 = 3
         **/
        self.title = "509. 斐波那契数"
        
        debugPrint(fib(3))
    }
    
    // 2个属性 循环计算结果
    func fib(_ n: Int) -> Int {
        if n < 2 {
            return n
        }
        
        var pre = 0
        var current = 1
        
        for _ in 2...n {
            let result = pre + current
            pre = current
            current = result
        }
        return current
    }
    
//    // 递归实现
//    func fib(_ n: Int) -> Int {
//        if n < 2 {
//            return n
//        }
//
//        var pre = 0
//        var current = 1
//        var index = 2
//        fib(current: &current, pre: &pre, index: &index, n: n)
//        return current
//    }
//
//    func fib(current: inout Int, pre: inout Int, index: inout Int, n: Int) {
//        if index > n {
//            return
//        }
//        let sum = current + pre
//        pre = current
//        current = sum
//        index += 1
//        fib(current: &current, pre: &pre, index: &index, n: n)
//    }
    
    
//    // 动态规划解决
//    func fib(_ n: Int) -> Int {
//        if n < 2 {
//            return n
//        }
//
//        var dp = [Int](repeating: 0, count: n + 1)
//        dp[0] = 0
//        dp[1] = 1
//
//        for i in 2...n {
//            dp[i] = dp[i - 1] + dp[i - 2]
//        }
//        return dp[n]
//    }
}
