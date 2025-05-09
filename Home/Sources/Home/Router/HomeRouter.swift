//
//  HomeRouter.swift
//  Home
//
//  Created by Adel Aref on 25/11/2024.
//
import UIKit
import SwiftUI

@MainActor
public protocol HomeCoordinatorContract {
    func openProfileView()
}

@MainActor
public class HomeRouter: HomeCoordinatorContract {
    public var coordinator: HomeCoordinatorContract?
    public var navigationController: UINavigationController?
     public static let shared = HomeRouter()
    
    init() {
        
    }
    
    public func openHomeView() {
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
    public func openAccountDetailsView() {
        let viewController = UIHostingController(rootView: AccountDetailsView())
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // to open external view (profile)
    public func openProfileView() {
        coordinator?.openProfileView()
    }
}

