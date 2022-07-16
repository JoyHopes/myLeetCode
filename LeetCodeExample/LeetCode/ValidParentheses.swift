//
//  ValidParentheses.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/15.
//

import Foundation

class ValidParentheses: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

         有效字符串需满足：

         左括号必须用相同类型的右括号闭合。
         左括号必须以正确的顺序闭合。

         示例 1：
         输入：s = "()"
         输出：true
         
         示例 2：
         输入：s = "()[]{}"
         输出：true
         
         示例 3：
         输入：s = "(]"
         输出：false
         
         示例 4：
         输入：s = "([)]"
         输出：false
         
         示例 5：
         输入：s = "{[]}"
         输出：true

         */
        self.title = "20. 有效的括号"
        
        debugPrint(isValid("(]"))
    }
    func isValid(_ s: String) -> Bool {
        var stackArray = [String]()
        let chars = s.compactMap { "\($0)" }
        for i in 0..<chars.count {
            if chars[i] == ")" {
                let char = stackArray.popLast()
                if char != "(" {
                    return false
                }
            } else if chars[i] == "]" {
                let char = stackArray.popLast()
                if char != "[" {
                    return false
                }
            } else if chars[i] == "}" {
                let char = stackArray.popLast()
                if char != "{" {
                    return false
                }
            } else {
                stackArray.append(chars[i])
            }
        }
        return stackArray.isEmpty
    }
//    func isValid(_ s: String) -> Bool {
//        var charList = [String]()
//        let charArray: [String] = s.compactMap { (item) -> String in
//            return "\(item)"
//        }
//        for i in 0..<charArray.count {
//            let char = charArray[i]
//            if char == "(" || char == "[" || char == "{" {
//                charList.append(char)
//            } else if char == ")" {
//                if charList.popLast() != "(" {
//                    return false
//                }
//            } else if char == "]" {
//                if charList.popLast() != "[" {
//                    return false
//                }
//            } else if char == "}" {
//                if charList.popLast() != "{" {
//                    return false
//                }
//            }
//        }
//
//        if charList.isEmpty == false {
//            return false
//        }
//
//        return true
//    }
}
