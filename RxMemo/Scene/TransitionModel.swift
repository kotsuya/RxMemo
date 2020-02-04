//
//  TransitionModel.swift
//  RxMemo
//
//  Created by seunghwan.yoo on 2020/01/16.
//  Copyright © 2020 seunghwan.yoo. All rights reserved.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}
