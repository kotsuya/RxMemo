//
//  MemoDetailViewController.swift
//  RxMemo
//
//  Created by seunghwan.yoo on 2020/01/16.
//  Copyright © 2020 seunghwan.yoo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MemoDetailViewController: UIViewController, ViewModelBindableType {
    
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var deleteButton: UIBarButtonItem!    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    var viewModel: MemoDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        viewModel.contents
            .bind(to: listTableView.rx.items) { tableView, row, value in
                switch row {
                case 0:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell")!
                    cell.textLabel?.text = value
                    return cell
                case 1:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell")!
                    cell.textLabel?.text = value
                    return cell
                default:
                    fatalError()
                }
            }
            .disposed(by: rx.disposeBag)
        
//        var backButton = UIBarButtonItem(title: nil, style: .done, target: nil, action: nil)
//        viewModel.title
//            .drive(backButton.rx.title)
//            .disposed(by: rx.disposeBag)
//        backButton.rx.action = viewModel.popAction
//        navigationItem.hidesBackButton = true
//        navigationItem.leftBarButtonItem = backButton
        
        editButton.rx.action = viewModel.makeEditAction()
        
        deleteButton.rx.action = viewModel.makeDeleteAction()
        
        shareButton.rx.tap
            .throttle(.microseconds(500), scheduler: MainScheduler.instance) //check the double tap
            .subscribe(onNext: { [weak self] _ in
                guard let memo = self?.viewModel.memo.content else { return }
                
                let vc = UIActivityViewController(activityItems: [memo], applicationActivities: nil)
                self?.present(vc, animated: true, completion: nil)
            }).disposed(by: rx.disposeBag)
    }

}
