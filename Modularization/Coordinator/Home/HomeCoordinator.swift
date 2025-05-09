//
//  HomeCoordinator.swift
//  OneBankModularization
//
//  Created by Adel Aref on 25/11/2024.
//
import Home

@MainActor
class HomeCoordinator: HomeCoordinatorContract {
   
    weak var appCoordiantor: AppCoordinator?
    let homeRouter: HomeRouter = HomeRouter.shared
    
    init(appCoordiantor: AppCoordinator) {
        self.appCoordiantor = appCoordiantor
        homeRouter.navigationController = appCoordiantor.navigationController
        homeRouter.coordinator = self
    }
    
    public func openHomeView() {
        homeRouter.openHomeView()
    }
    
    // to be used fired from profile module
    public func openAccountDetailsView() {
        homeRouter.openAccountDetailsView()
    }
    
    // to open external view (profile) not public
    func openProfileView() {
        appCoordiantor?.profileCoordinator.openProfileView()
    }
}
