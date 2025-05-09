//
//  ProfileCoordinator.swift
//  OneBankModularization
//
//  Created by Adel Aref on 26/11/2024.
//

import Profile
import UIKit

@MainActor
class ProfileCoordinator: ProfileCoordinatorContract {
   
    weak var appCoordiantor: AppCoordinator?
    
    init(appCoordiantor: AppCoordinator) {
        self.appCoordiantor = appCoordiantor
    }
    
    public func openProfileView() { 
        let profileRouter = ProfileRouter(
            coordinator: self, navigationController: appCoordiantor?.navigationController ?? UINavigationController()
        )
        profileRouter.openProfileView()
    }
    
    public func openAccountDetailsView() {
        appCoordiantor?.homeCoordinator.openAccountDetailsView()
    }
    
    public func openHomeView() {
        appCoordiantor?.homeCoordinator.openHomeView()
    }
}

