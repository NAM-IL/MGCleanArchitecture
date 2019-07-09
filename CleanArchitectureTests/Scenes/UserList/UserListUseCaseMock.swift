//
//  UserListUseCaseMock.swift
//  CleanArchitecture
//
//  Created by Tuan Truong on 1/14/19.
//  Copyright © 2019 Sun Asterisk. All rights reserved.
//

@testable import CleanArchitecture
import RxSwift

final class UserListUseCaseMock: UserListUseCaseType {

    // MARK: - getUserList

    var getUserListCalled = false

    var getUserListReturnValue: Observable<PagingInfo<User>> = {
        let items = [
            User().with { $0.id = "1" }
        ]
        
        let page = PagingInfo<User>(page: 1, items: items)
        return Observable.just(page)
    }()

    func getUserList(page: Int) -> Observable<PagingInfo<User>> {
        getUserListCalled = true
        return getUserListReturnValue
    }
}
