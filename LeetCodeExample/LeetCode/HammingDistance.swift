//
//  HammingDistance.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/15.
//

import Foundation

class HammingDistance: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         两个整数之间的 汉明距离 指的是这两个数字对应二进制位不同的位置的数目。

         给你两个整数 x 和 y，计算并返回它们之间的汉明距离。
         
         输入：x = 1, y = 4
         输出：2
         解释：
         1   (0 0 0 1)
         4   (0 1 0 0)
                ↑   ↑
         上面的箭头指出了对应二进制位不同的位置。

         */
        
        self.title = "461. 汉明距离"
        
        debugPrint(hammingDistance(1, 4))
    }
    
    /*
     * 思路
     1、异或^运算 求出不一样的二进制数 比如1^1 = 0 0^0 = 0 1^0 = 1
     2、与&运算 通过X&X-1 快速消除末尾的1 计算1的个数  终止条件是xor为0
     */
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var distance = 0
        var xor = x ^ y
        while xor != 0 {
            xor &= xor - 1
            distance += 1
        }
        return distance
    }
}
