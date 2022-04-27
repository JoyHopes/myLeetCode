//
//  LeetCodeBaseVC.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/17.
//

import Foundation
import UIKit

class LeetCodeBaseVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "返回", image: nil, primaryAction: nil, menu: nil)
        navigationItem.backBarButtonItem?.tintColor = .black
    }
}
