//
//  SearchCoordinator.swift
//  learningCoordinator
//
//  Created by João Pedro Cappelletto D'Agnoluzzo on 24/01/20.
//  Copyright © 2020 João Pedro Cappelletto D'Agnoluzzo. All rights reserved.
//

import UIKit

protocol SearchCoordinatorDelegate: class {
    func searchCoordinatorShouldDismiss(data: String)
}

final class SearchCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var searchViewController: SearchViewController?
    private var detailCoordinator: DetailCoordinator?
    weak var delegate: SearchCoordinatorDelegate?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let searchViewController = SearchViewController()
        searchViewController.delegate = self
        searchViewController.modalPresentationStyle = .fullScreen
        self.searchViewController = searchViewController
        self.presenter.present(searchViewController, animated: true, completion: nil)
    }
    
    func dismissViewControllers(){
        self.searchViewController?.dismiss(animated: true, completion: nil)
    }
}

extension SearchCoordinator: SearchViewControllerDelegate {
    func searchViewControllerDidTouchDetail() {
        var data: String = ""
        data = self.searchViewController!.title!
        delegate?.searchCoordinatorShouldDismiss(data: data)
    }
}
