//
//  AppDelegate.swift
//  CleanArchitecture
//
//  Created by Tuan Truong on 6/4/18.
//  Copyright © 2018 Sun Asterisk. All rights reserved.
//

import UIKit
import MagicalRecord

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var assembler: Assembler = DefaultAssembler()
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        setupCoreData()
//        configSDWebImageDownloader()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if NSClassFromString("XCTest") != nil { // test
            window?.rootViewController = UnitTestViewController()
            window?.makeKeyAndVisible()
        } else {
            bindViewModel()
        }
    }
    
    private func configSDWebImageDownloader() {
        let downloader = SDWebImageDownloader.shared
        downloader.config.username = "username"
        downloader.config.password = "password"
    }
    
    private func setupCoreData() {
        MagicalRecord.setupAutoMigratingCoreDataStack()
        MagicalRecord.setLoggingLevel(MagicalRecordLoggingLevel.error)
    }

    private func bindViewModel() {
        guard let window = window else { return }
        
        let vm: AppViewModel = assembler.resolve(window: window)
        let input = AppViewModel.Input(loadTrigger: Driver.just(()))
        let output = vm.transform(input)
        
        output.toMain
            .drive()
            .disposed(by: rx.disposeBag)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        MagicalRecord.cleanUp()
    }
}

