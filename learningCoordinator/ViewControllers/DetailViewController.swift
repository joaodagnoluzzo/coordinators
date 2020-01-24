//
//  DetailViewController.swift
//  learningCoordinator
//
//  Created by João Pedro Cappelletto D'Agnoluzzo on 23/01/20.
//  Copyright © 2020 João Pedro Cappelletto D'Agnoluzzo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol DetailViewControllerDelegate: class {
    func detailViewControllerShouldDismiss()
}

final class DetailViewController: UIViewController {

    private let disposeBag = DisposeBag()
    private var closeButton: UIButton!
    var type: TransitionType?
    weak var delegate: DetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        self.view.backgroundColor = .white
        
        if let type = type, type == .modal {
            addCloseButton()
            setupConstraints()
        }
    }
    
    func addCloseButton(){
        closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        self.view.addSubview(closeButton)
        
        closeButton.rx.tap.bind(onNext: {
            self.delegate?.detailViewControllerShouldDismiss()
        }).disposed(by: disposeBag)
    }
    
    func setupConstraints(){
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        closeButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
}
