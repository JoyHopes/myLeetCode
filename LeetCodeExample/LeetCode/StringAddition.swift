//
//  StringAddition.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/16.
//

import Foundation

class StringAddition: LeetCodeBaseVC {
    
    /*
     *
     给定两个字符串形式的非负整数 num1 和num2 ，计算它们的和并同样以字符串形式返回。

     你不能使用任何內建的用于处理大整数的库（比如 BigInteger）， 也不能直接将输入的字符串转换为整数形式。

      

     示例 1：

     输入：num1 = "11", num2 = "123"
     输出："134"
     示例 2：

     输入：num1 = "456", num2 = "77"
     输出："533"
     示例 3：

     输入：num1 = "0", num2 = "0"
     输出："0"

     */
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.title = "415. 字符串相加"
        
        debugPrint(addStrings("1", "9"))
    }
    
//    func addStrings(_ num1: String, _ num2: String) -> String {
//        var stringResult = ""
//
//        let num1Array = Array(num1)
//
//        let num2Array = Array(num2)
//
//        var i = num1Array.count - 1
//        var j = num2Array.count - 1
//
//        // 进位变量
//        var carry = 0
//        while i >= 0 || j >= 0 || carry == 1 {
//            let x = i < 0 ? 0 : num1Array[i].asciiValue! - String.Element("0").asciiValue!
//            let y = j < 0 ? 0 : num2Array[j].asciiValue! - String.Element("0").asciiValue!
//            stringResult.append("\((Int(x + y) + carry) % 10)")
//            carry = (Int(x + y) + carry) / 10
//            i -= 1
//            j -= 1
//        }
//
//        return String(stringResult.reversed())
//    }
    
    func addStrings(_ num1: String, _ num2: String) -> String {
        var num1 = Array(num1)
        var num2 = Array(num2)
        
        
        var result = [Int]()
        var addOne = 0 // 进位标记
        
        let asciiZero = String.Element("0").asciiValue!
        
        while num1.count > 0, num2.count > 0 {
            let a = Int(num1.removeLast().asciiValue! - asciiZero)
            let b = Int(num2.removeLast().asciiValue! - asciiZero)
            
            let sum = a + b + addOne
            if sum >= 10 {
                addOne = 1
            } else {
                addOne = 0
            }
            result.append(sum % 10)
        }
        
        while num1.count > 0 {
            let a = Int(num1.removeLast().asciiValue! - asciiZero)
            let sum = a + addOne
            if sum >= 10 {
                addOne = 1
            } else {
                addOne = 0
            }
            result.append(sum % 10)
        }
        
        while num2.count > 0 {
            let a = Int(num2.removeLast().asciiValue! - asciiZero)
            let sum = a + addOne
            if sum >= 10 {
                addOne = 1
            } else {
                addOne = 0
            }
            result.append(sum % 10)
        }
        
        if addOne == 1 {
            result.append(1)
        }
        
        result = result.reversed()
        
        return result.map { "\($0)"}.joined(separator: "")
    }
}
