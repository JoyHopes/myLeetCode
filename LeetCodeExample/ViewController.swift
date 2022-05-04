//
//  ViewController.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/4/17.
//

import UIKit
import RxSwift
import RxCocoa

public struct ExampleModel {
    let title: String
    let className: UIViewController.Type
}

struct ExampleConst {
    static let datasource: Observable = Observable.just([
        ExampleModel(title: "0. 十大排序算法", className: SortAlgorithm.self),
        ExampleModel(title: "1. 两个数之和", className: SumOfTwoNumbers.self),
        ExampleModel(title: "21. 合并2个有序链表", className: MergesTwoOrderedLists.self),
        ExampleModel(title: "24. 两两交换链表中的节点", className: SwapNodesInALinkedListInPairs.self),
        ExampleModel(title: "70. 爬楼梯", className: ClimbStairs.self),
        ExampleModel(title: "83. 删除排序链表中的重复元素", className: RemovesDuplicateElementsFromSortedLinkedLists.self),
        ExampleModel(title: "88. 合并2个有序数组", className: MergesTwoOrderedArrays.self),
        ExampleModel(title: "94. 二叉树的中序遍历", className: MiddleOrderTraversalOfBinaryTrees.self),
        ExampleModel(title: "101. 对称二叉树", className: SymmetricBinaryTree.self),
        ExampleModel(title: "104. 二叉树的最大深度", className: TheMaximumDepthOfABinaryTree.self),
        ExampleModel(title: "110. 平衡二叉树", className: BalancedBinaryTree.self),
        ExampleModel(title: "141. 环链表1", className: ChainTableFirst.self),
        ExampleModel(title: "142. 环链表2", className: ChainTableSecond.self),
        ExampleModel(title: "144. 二叉树的前序遍历", className: AntecedentTraversalOfBinaryTrees.self),
        ExampleModel(title: "145. 二叉树的后序遍历", className: BackwardTraversalOfABinaryTree.self),
        ExampleModel(title: "160. 相交链表", className: ChainTableSecond.self),
        ExampleModel(title: "206. 反转链表", className: ReverseALinkedList.self),
        ExampleModel(title: "226. 翻转二叉树", className: FlipTheBinaryTree.self),
        ExampleModel(title: "232. 用栈实现队列", className: ImplementQueuesWithStacks.self),
        ExampleModel(title: "234. 回文链表", className: PalindromeList.self),
        ExampleModel(title: "283. 移动零", className: MobileZero.self),
        ExampleModel(title: "394. 字符串解码", className: StringDecode.self),
        ExampleModel(title: "448. 找到所有数组中消失的数字", className: MissingDataFromAnArray.self),
        ExampleModel(title: "876. 链表的中间结点", className: TheMiddleNodeOfALinkedList.self),
        ExampleModel(title: "912. 排序数组", className: SortAnArray.self),
        ExampleModel(title: "剑指 Offer 22. 链表中倒数第k个节点", className: TheKthLastNodeInALinkedList.self)
    ])
}

class ViewController: LeetCodeBaseVC {

    @IBOutlet weak var exampleTb: UITableView!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "LeetCode Example"
        
        // 注册cell
        exampleTb.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCellID")
        
        // 数据源
        ExampleConst.datasource
            .bind(to: exampleTb.rx.items(cellIdentifier: "UITableViewCellID")) { (index, model, cell) in
                cell.textLabel?.text = model.title
        }.disposed(by: disposeBag)
        
        // 点击事件
        exampleTb.rx.modelSelected(ExampleModel.self).subscribe(onNext: { [weak self] (model) in
            guard let `self` = self else { return }
            self.navigationItem.backBarButtonItem?.title = ""
            self.navigationController?.pushViewController(model.className.init(), animated: true)
        }).disposed(by: disposeBag)
        
        // deselect
        exampleTb.rx.itemSelected.subscribe(onNext: { [weak self] (indexPath) in
            guard let `self` = self else { return }
            self.exampleTb.deselectRow(at: indexPath, animated: true)
        }).disposed(by: disposeBag)
        // Do any additional setup after loading the view.
    }


}

