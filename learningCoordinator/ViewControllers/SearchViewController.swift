//
//  SearchViewController.swift
//  learningCoordinator
//
//  Created by João Pedro Cappelletto D'Agnoluzzo on 24/01/20.
//  Copyright © 2020 João Pedro Cappelletto D'Agnoluzzo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol SearchViewControllerDelegate: class {
    func searchViewControllerDidTouchDetail()
}

final class SearchViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private var detailButton: UIButton!
    weak var delegate: SearchViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Search"
        self.view.backgroundColor = .systemRed
        
        addDetailButton()
        setupConstraints()
    }
    
    func addDetailButton(){
        detailButton = UIButton(type: .system)
        detailButton.setTitle("Detail", for: .normal)
        self.view.addSubview(detailButton)
        
        detailButton.rx.tap.bind(onNext: {
            self.delegate?.searchViewControllerDidTouchDetail()
        }).disposed(by: disposeBag)
        
    }
    
    func setupConstraints(){
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        detailButton.centerYAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        detailButton.centerXAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
}
