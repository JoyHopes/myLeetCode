//
//  Heapsort.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/8.
//

import Foundation

class Heapsort: LeetCodeBaseVC {
    
    // 数组长度
    private var len: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "堆排序"
        
        var nums = [86, 39, 77, 23, 32, 45, 58, 63, 93, 4, 37, 22]
//        var nums = [35, 63, 48, 9, 86, 24, 53, 11]
        fnHeapsort(&nums)
    }
    
    func fnHeapsort(_ nums: inout [Int]) {
        len = nums.count
        if len < 1 {
            return
        }
        
        // 1、构建一个最大堆
        buildMaxHeap(&nums)
        // 2、循环将堆首位（最大值）与未排序末位交换， 然后重新调整为最大堆
        while len > 0 {
            swap(&nums, 0, len - 1)
            len -= 1
            adjustHeap(&nums, 0)
            print(nums)
        }
    }
    
    // 调整为最大堆
    func adjustHeap(_ array: inout [Int], _ i: Int) {
        var maxIndex = i
        let left = 2*i + 1
        let right = 2*(i + 1)
        
        // 如果有左子树，且左子树大于父节点，则将最大指针指向左子树
        if left < len, array[left] > array[maxIndex] {
            maxIndex = left
        }
        // 如果有右子树，且右子树大于父节点，且大于左子树，则将最大指针指向右子树
        if right < len, array[right] > array[maxIndex], array[right] > array[left] {
            maxIndex = right
        }
        
        // 如果父节点不是最大值，则将父节点与最大值交换，并且调整与父节点交换位置
        if maxIndex != i {
            swap(&array, maxIndex, i)
            print("调整为最大堆 = \(array )")
            adjustHeap(&array, maxIndex)
        }
    }
    
    // 建立一个最大堆
    func buildMaxHeap(_ array: inout [Int]) {
        // 从最后一个非叶子节点开始向上构造最大堆
        for i in (0...(len/2-1)).reversed() {
            print("buildMaxHeap i = \(i)")
            adjustHeap(&array, i)
        }
        print("构造完成最大堆：\(array)")
    }
    
    // 交换数组内两个元素
    func swap(_ array: inout [Int], _ i: Int, _ j: Int) {
        let temp = array[i]
        array[i] = array[j]
        array[j] = temp
    }
}
