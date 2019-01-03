//
// ProductsUseCaseMock.swift
// CleanArchitecture
//
// Created by Tuan Truong on 6/5/18.
// Copyright © 2018 Framgia. All rights reserved.
//

@testable import CleanArchitecture
import RxSwift

final class ProductsUseCaseMock: ProductsUseCaseType {

    // MARK: - getProductList
    
    var getProductList_Called = false
    
    var getProductList_ReturnValue: Observable<PagingInfo<Product>> = {
        let items = [
            Product().with { $0.id = 1 }
        ]
        let page = PagingInfo<Product>(page: 1, items: items)
        return Observable.just(page)
    }()
    
    func getProductList() -> Observable<PagingInfo<Product>> {
        getProductList_Called = true
        return getProductList_ReturnValue
    }

    // MARK: - loadMoreProductList
    
    var loadMoreProductList_Called = false
    
    var loadMoreProductList_ReturnValue: Observable<PagingInfo<Product>> = {
        let items = [
            Product().with { $0.id = 2 }
        ]
        let page = PagingInfo<Product>(page: 2, items: items)
        return Observable.just(page)
    }()
    
    func loadMoreProductList(page: Int) -> Observable<PagingInfo<Product>> {
        loadMoreProductList_Called = true
        return loadMoreProductList_ReturnValue
    }
    
    // MARK: - deleteProduct
    
    var deleteProduct_Called = false
    var deleteProduct_ReturnValue: Observable<Void> = Observable.empty()
    
    func deleteProduct(id: Int) -> Observable<Void> {
        deleteProduct_Called = true
        return deleteProduct_ReturnValue
    }
}
