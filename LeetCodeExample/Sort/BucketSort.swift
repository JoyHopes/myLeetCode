//
//  BucketSort.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/10.
//

import Foundation

class BucketSort: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "桶排序"
        
        let nums = [86, 39, 77, 23, 32, 45, 58, 63, 93, 4, 37, 22]
        var bucketCap = 2
        debugPrint(fnBucketSort(nums, &bucketCap))
    }
    
    func fnBucketSort(_ array: [Int], _ bucketCap: inout Int) -> [Int] {
        if array.count < 2 {
            return array
        }
        
        var max = array[0]
        var min = array[0]
        for number in array {
            if number > max {
                max = number
            } else if number < min {
                min = number
            }
        }
        
        // 获取桶的数量
        let bucketCount = (max - min) / bucketCap + 1
        // 构建桶
        var bucketArr = [[Int]](repeating: [Int](), count: bucketCount)
        var resultArr = [Int]()
        
        // 将原始数组中的数据分配到桶中
        for number in array {
            let index = (number - min) / bucketCap
            bucketArr[index].append(number)
        }
        
        // 看看桶中数据的分布
        for (i, number) in bucketArr.enumerated() {
            print("第\(i)个桶包含数据：\(number)")
        }
        
        for i in 0..<bucketCount {
            if bucketCap == 1 {
                for j in 0..<bucketArr[i].count {
                    resultArr.append(bucketArr[i][j])
                }
            } else {
                if bucketCount == 1 {
                    bucketCap -= 1
                }
                print("对第\(i)桶中的数据再次进行桶排序 ------ ")
                let temp = fnBucketSort(bucketArr[i], &bucketCap)
                for number in temp {
                    resultArr.append(number)
                }
            }
        }
        
        return resultArr
    }
}
