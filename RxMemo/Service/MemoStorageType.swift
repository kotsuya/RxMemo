//
//  MemoStorageType.swift
//  RxMemo
//
//  Created by seunghwan.yoo on 2020/01/15.
//  Copyright © 2020 seunghwan.yoo. All rights reserved.
//

import Foundation
import RxSwift

protocol MemoStorageType {
    @discardableResult
    func createMemo(content: String) -> Observable<Memo>
    
    @discardableResult
    func memoList() -> Observable<[MemoSectionModel]>
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo>
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo>
}
