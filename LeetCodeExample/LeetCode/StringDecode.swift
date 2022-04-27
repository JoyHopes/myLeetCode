//
//  StringDecode.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/25.
//

import Foundation

class StringDecode: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title  = "394. 字符串解码"
        
        debugPrint("\(decodeString("30[a2[c]]"))")
    }
    
    
    func decodeString(_ s: String) -> String {
        var stack = [(Int, String)]()
        var res = ""
        var muti = 0
        for c in s {
            if c == "[" {
                debugPrint("c 000 append \(muti) == \(res)")
                stack.append((muti, res))
                muti = 0
                res = ""
            } else if c == "]" {
                if let (curMuti, lastRes) = stack.popLast() {
                    res = lastRes + String(repeating: res, count: curMuti)
                    debugPrint("c ==112 \(curMuti) == \(lastRes) == \(res)")
                }
            } else if c.isWholeNumber {
                debugPrint("c == \(muti) == \(c.wholeNumberValue!) == ")
                muti = muti*10 + c.wholeNumberValue!
                debugPrint("c == \(c) == \(muti)")
            } else {
                debugPrint("c append \(c)")
                res.append(c)
            }
        }
        return res
    }
}
