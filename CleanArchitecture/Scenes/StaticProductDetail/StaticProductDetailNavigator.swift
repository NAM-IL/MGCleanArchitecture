//
//  StaticProductDetailNavigator.swift
//  CleanArchitecture
//
//  Created by Tuan Truong on 6/22/18.
//  Copyright © 2018 Sun Asterisk. All rights reserved.
//

protocol StaticProductDetailNavigatorType {
    
}

struct StaticProductDetailNavigator: StaticProductDetailNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
