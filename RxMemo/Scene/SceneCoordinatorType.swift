//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by seunghwan.yoo on 2020/01/16.
//  Copyright © 2020 seunghwan.yoo. All rights reserved.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
    
    @discardableResult
    func close(animated: Bool) -> Completable
}
