//
//  SortAlgorithm.swift
//  LeetCodeExample
//
//  Created by lumos.zheng on 2022/5/3.
//

import Foundation
import RxSwift
import UIKit
import SnapKit

struct SortConst {
    static let sorts: Observable = Observable.just([
        ExampleModel(title: "冒泡排序", className: BubbleSort.self),
        ExampleModel(title: "选择排序", className: SelectionSort.self),
        ExampleModel(title: "插入排序", className: InsertionSorting.self),
        ExampleModel(title: "希尔排序", className: ShellSort.self),
        ExampleModel(title: "快速排序", className: Qksort.self),
        ExampleModel(title: "归并排序", className: OrderByMerging.self),
        ExampleModel(title: "堆排序", className: Heapsort.self),
        ExampleModel(title: "计数排序", className: CountSorting.self),
        ExampleModel(title: "桶排序", className: BucketSort.self),
        ExampleModel(title: "基数排序", className: RadixSorting.self)])
}

class SortAlgorithm: LeetCodeBaseVC {
        
    lazy var exampleTb: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCellSortID")
        return table
    }()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "0. 十大排序算法"
        
        view.addSubview(exampleTb)
        exampleTb.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        // 数据源
        SortConst.sorts
            .bind(to: exampleTb.rx.items(cellIdentifier: "UITableViewCellSortID")) { (index, model, cell) in
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
    }
}
