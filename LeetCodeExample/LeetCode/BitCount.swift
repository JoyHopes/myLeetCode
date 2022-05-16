//
//  BitCount.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/13.
//

import Foundation
import UIKit
import SDWebImage

class BitCount: LeetCodeBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "338. 比特位计数"
        
        debugPrint(countBits(0))
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(200)
            make.center.equalToSuperview()
        }
        
        imageView.sd_setImage(with: URL(string: "https://cloud-cdn.hengchiauto.com/appsrv/1007/078a452e16a5363ff0f0683bc1597baf/03d2595f-4b8b-492b-a31b-1466db3ee50b.jpg"))
    }
    
//    // 奇偶数解决
//    // 奇数比偶数的二进制 多1个1 比如1：001 2：010 3: 011 4：100 5: 101 6: 110 7: 111
//    // >> 右移减半 当前偶数与偶数递归减半后的数字 二进制包含1的个数是一致的 例如8: 1000 4: 100 2: 10 利用>>位移算出前面偶数中二进制包含1的个数
//    func countBits(_ n: Int) -> [Int] {
//        var bits = [Int](repeating: 0, count: n + 1)
//        for i in 0...n {
//            bits[i] = (i&1) == 1 ? bits[i-1]+1 : bits[i>>1]
//        }
//
//        return bits
//    }
    
    // &运算 通过x&(x-1) 清除最低位1
    func countBits(_ n: Int) -> [Int] {
        var bits = [Int](repeating: 0, count: n + 1)
        for i in 1...n {
            bits[i] = bits[i&(i-1)] + 1
        }

        return bits
    }
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
}
