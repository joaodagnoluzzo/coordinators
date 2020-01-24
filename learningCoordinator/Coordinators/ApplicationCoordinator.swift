//
//  ApplicationCoordinator.swift
//  learningCoordinator
//
//  Created by João Pedro Cappelletto D'Agnoluzzo on 23/01/20.
//  Copyright © 2020 João Pedro Cappelletto D'Agnoluzzo. All rights reserved.
//

import UIKit

final class ApplicationCoordinator: Coordinator {
    
    private let window: UIWindow
    private let rootViewController: UINavigationController
    private let homeCoordinator: HomeCoordinator
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        homeCoordinator = HomeCoordinator(presenter: rootViewController)
    }
    
    func start() {
        window.rootViewController = rootViewController
        homeCoordinator.start()
        window.makeKeyAndVisible()
    }
}
