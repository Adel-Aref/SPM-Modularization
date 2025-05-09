//
//  Coordinator.swift
//
//
//  Created by Adel Aref on 21/07/2024.
//

import UIKit
import SwiftUI
import Profile
import Home


@MainActor
protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

final class AppCoordinator: Coordinator {
    private var window: UIWindow
    
    var navigationController: UINavigationController
    lazy var homeCoordinator = HomeCoordinator(appCoordiantor: self)
    lazy var profileCoordinator = ProfileCoordinator(appCoordiantor: self)
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.window = window
        if #available(iOS 13.0, *) {
            window.overrideUserInterfaceStyle = .unspecified
        }
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.navigationBar.tintColor = .black
        homeCoordinator.openHomeView()
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
}

