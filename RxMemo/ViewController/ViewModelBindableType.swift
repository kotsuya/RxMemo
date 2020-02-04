//
//  ViewModelBindableType.swift
//  RxMemo
//
//  Created by seunghwan.yoo on 2020/01/16.
//  Copyright © 2020 seunghwan.yoo. All rights reserved.
//

import UIKit

protocol ViewModelBindableType {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    func bindViewModel()
}

extension ViewModelBindableType where Self: UIViewController {
    mutating func bind(viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        loadViewIfNeeded()
        
        bindViewModel()
    }
}
