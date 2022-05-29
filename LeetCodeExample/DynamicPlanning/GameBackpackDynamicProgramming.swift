//
//  GameBackpackDynamicProgramming.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/23.
//

import Foundation
import UIKit
 
class GameBackpackDynamicProgramming: LeetCodeBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let goods = [Element(name: "天安门", value: 9, cost: 1),
                     Element(name: "故宫", value: 9, cost: 4),
                     Element(name: "颐和园", value: 9, cost: 2),
                     Element(name: "八达岭长城", value: 7, cost: 1),
                     Element(name: "天坛", value: 6, cost: 1),
                     Element(name: "圆明园", value: 8, cost: 2),
                     Element(name: "恭王府", value: 5, cost: 1)]
        // 二维数组
//        fnGameBackpackDynamicProgramming(goods: goods, bagSize: 6)
        
        // 一维数组
        fnOneDimensionalArrayDynamicProgramming(goods: goods, bagSize: 6)
    }
}

// 一维数组 实现动态规划
// 这里只是取一个最大值 没有详细的组合 若需要详细的组合 还是用二维数组更好 更方便理解
func fnOneDimensionalArrayDynamicProgramming(goods: [Element], bagSize: Int) {
    var calcArray = [Int](repeating: 0, count: bagSize + 1)
    
    for goodIndex in 0..<goods.count {
        let goodsCost = goods[goodIndex].cost
        debugPrint("\(goods[goodIndex].name) :空间耗费：\(goodsCost),价值：\(goods[goodIndex].value)")
        for currentSize in (0...bagSize).reversed() {
            debugPrint("目前背包大小：\(currentSize)")
            if currentSize >= goodsCost {
                debugPrint("\(goods[goodIndex].name)当前价值：\(goods[goodIndex].value) 剩余背包的存储价值：\(calcArray[currentSize - goodsCost])")
                calcArray[currentSize] = max(calcArray[currentSize - goodsCost] + goods[goodIndex].value, calcArray[currentSize])
            }
            debugPrint(calcArray)
        }
        debugPrint("--------")
    }
    debugPrint("最终结果：\(calcArray[bagSize])")
}

// 二维数组 实现动态规划
func fnGameBackpackDynamicProgramming(goods: [Element], bagSize: Int) {
    var calcArray = [[ArrayElement]](repeating: [ArrayElement](repeating: ArrayElement(value: 0, element: Element(name: "", value: 0, cost: 0)), count: bagSize), count: goods.count)
    
    for i in 0..<goods.count {
        for j in 0..<bagSize {
            if i == 0 { // 第一行特殊处理
                var arrayElement = ArrayElement(value: goods[i].value, element: goods[i])
                arrayElement.elements.append(goods[i])
                calcArray[i][j] = arrayElement
            } else {
                 // 计算
                let spareSpace = j + 1 - goods[i].cost
                if spareSpace < 0 {
                    calcArray[i][j] = calcArray[i-1][j]
                } else {
                    let preRow = i - 1
                    let preRowValue = calcArray[preRow][j].value
                    
                    var currentGoodsValue = goods[i].value
                    if spareSpace > 0 {
                        currentGoodsValue += calcArray[preRow][spareSpace-1].value
                    }
                    
                    if preRowValue >= currentGoodsValue {
                        calcArray[i][j] = calcArray[preRow][j]
                    } else {
                        if spareSpace == 0 {
                            var arrayElement = ArrayElement(value: currentGoodsValue, element: goods[i])
                            arrayElement.elements.append(goods[i])
                            calcArray[i][j] = arrayElement
                        } else {
                            var elements = calcArray[preRow][spareSpace-1]
                            elements.elements.append(goods[i])
                            elements.value = currentGoodsValue

                            calcArray[i][j] = elements
                        }
                    }
                }
            }
        }
    }
    
    debugPrint("总的价值 == \(calcArray[goods.count-1][bagSize-1].value) 背包总数量：\(bagSize)")
    for element in calcArray[goods.count-1][bagSize-1].elements {
        debugPrint("\(element.name) == \(element.value) === \(element.cost)")
    }
}

struct ArrayElement {
    var value: Int               // 计算后的数组元素值
    var element: Element         // 计算后的数组元素值
    var elements = [Element]()   // 哪些物品组成了当前数组元素
}

struct Element {
    var name: String
    var value: Int // 物品的价值
    var cost: Int  // 物品的花费
}

