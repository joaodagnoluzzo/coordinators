//
//  DetailCoordinator.swift
//  learningCoordinator
//
//  Created by João Pedro Cappelletto D'Agnoluzzo on 23/01/20.
//  Copyright © 2020 João Pedro Cappelletto D'Agnoluzzo. All rights reserved.
//

import UIKit

enum TransitionType {
    case push
    case modal
}

final class DetailCoordinator: Coordinator {
    
    private let presenter: UINavigationController?
    private var detailViewController: DetailViewController?
    private var type: TransitionType = .push
    var title: String?
    
    init(presenter: UINavigationController, type: TransitionType) {
        self.presenter = presenter
        self.type = type
    }
    
    func start(){
        let detailViewController = DetailViewController()
        detailViewController.delegate = self
        detailViewController.type = type
        
        switch type {
        case .modal:
            detailViewController.view.backgroundColor = .systemTeal
            detailViewController.modalPresentationStyle = .overFullScreen
            presenter?.present(detailViewController, animated: true, completion: nil)
        default:
            detailViewController.view.backgroundColor = .systemGreen
            presenter?.pushViewController(detailViewController, animated: true)
        }
        self.detailViewController = detailViewController
    }
}

extension DetailCoordinator: DetailViewControllerDelegate {
    func detailViewControllerShouldDismiss() {
        self.presenter?.dismiss(animated: true, completion: nil)
    }
}
