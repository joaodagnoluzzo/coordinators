//
//  HomeCoordinator.swift
//  learningCoordinator
//
//  Created by João Pedro Cappelletto D'Agnoluzzo on 23/01/20.
//  Copyright © 2020 João Pedro Cappelletto D'Agnoluzzo. All rights reserved.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var homeViewController: ViewController?
    private var detailCoordinator: DetailCoordinator?
    private var searchCoordinator: SearchCoordinator?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let homeViewController = ViewController()
        homeViewController.delegate = self
        self.presenter.pushViewController(homeViewController, animated: true)
        self.homeViewController = homeViewController
    }
    
    private func startDetailCoordinator(data: String?, type: TransitionType){
        let detailCoordinator = DetailCoordinator(presenter: presenter, type: type)
        detailCoordinator.title = data
        detailCoordinator.start()
        self.detailCoordinator = detailCoordinator
    }
}

extension HomeCoordinator: HomeViewControllerDelegate {
    func homeViewControllerDidTouchPush() {
        startDetailCoordinator(data: nil, type: .push)
    }
    
    func homeViewControllerDidTouchModal() {
        startDetailCoordinator(data: nil, type: .modal)
    }
    
    func homeViewControllerDidTouchSearch() {
        let searchCoordinator = SearchCoordinator(presenter: presenter)
        searchCoordinator.delegate = self
        searchCoordinator.start()
        self.searchCoordinator = searchCoordinator
    }
}

extension HomeCoordinator: SearchCoordinatorDelegate {
    func searchCoordinatorShouldDismiss(data: String) {
        self.searchCoordinator?.dismissViewControllers()
        startDetailCoordinator(data: data, type: .modal)
    }
}
