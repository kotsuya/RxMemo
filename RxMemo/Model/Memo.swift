//
//  Memo.swift
//  RxMemo
//
//  Created by seunghwan.yoo on 2020/01/15.
//  Copyright © 2020 seunghwan.yoo. All rights reserved.
//

import Foundation
import RxDataSources

// RxDataSources
// tableView, collectionView binding できる datasourceを提供する
// **IdentifiableType 必要

struct Memo: Equatable, IdentifiableType {
    var content: String
    var insertDate: Date
    var identity: String
    
    init(content: String, insertDate: Date = Date()) {
        self.content = content
        self.insertDate = insertDate
        self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    init(original: Memo, updatedContent: String) {
        self = original
        self.content = updatedContent
    }
}
