//
//  TheMiniNumberCoinsAvailable.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/7/16.
//

import Foundation

class TheMiniNumberCoinsAvailable: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        /**
         剑指 Offer II 103. 最少的硬币数目
         给定不同面额的硬币 coins 和一个总金额 amount。编写一个函数来计算可以凑成总金额所需的最少的硬币个数。如果没有任何一种硬币组合能组成总金额，返回 -1。

         你可以认为每种硬币的数量是无限的。
         
         示例 1：

         输入：coins = [1, 2, 5], amount = 11
         输出：3
         解释：11 = 5 + 5 + 1
         示例 2：

         输入：coins = [2], amount = 3
         输出：-1
         示例 3：

         输入：coins = [1], amount = 0
         输出：0
         示例 4：

         输入：coins = [1], amount = 1
         输出：1
         示例 5：

         输入：coins = [1], amount = 2
         输出：2

         */
        
        self.title = "剑指 Offer II 103. 最少的硬币数目"
        
        debugPrint(coinChange([1], 0))
    }
    
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var coinList = [Int](repeating: Int.max, count: amount+1)
        coinList[0] = 0
        if amount > 0 {
            for i in 1...amount {
                for j in 0..<coins.count {
                    // (min(coinList[amount-2], coinList[amount-5], coinList[amount-7]))
                    let index = i - coins[j];
                    if index >= 0, coinList[index] != Int.max, coinList[index] + 1 < coinList[i] {
                        coinList[i] = coinList[index] + 1
                    }
                }
            }
        }
        return coinList[amount] == Int.max ? -1 : coinList[amount]
    }
}
