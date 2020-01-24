//
//  ViewController.swift
//  learningCoordinator
//
//  Created by João Pedro Cappelletto D'Agnoluzzo on 22/01/20.
//  Copyright © 2020 João Pedro Cappelletto D'Agnoluzzo. All rights reserved.
//

import RxSwift
import RxCocoa

import UIKit

protocol HomeViewControllerDelegate: class {
    func homeViewControllerDidTouchPush()
    func homeViewControllerDidTouchModal()
    func homeViewControllerDidTouchSearch()
}

final class ViewController: UIViewController {

    weak var delegate: HomeViewControllerDelegate?
    
    private let disposeBag = DisposeBag()
    
    private var pushButton: UIButton!
    private var modalButton: UIButton!
    private var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        self.view.backgroundColor = .white
        
        addPushButton()
        addModalButton()
        addSearchButton()
        setupButtonConstraints()
    }
    
    func addPushButton(){
        pushButton = UIButton(type: .system)
        pushButton.setTitle("Push", for: .normal)
        self.view.addSubview(pushButton)
        
        pushButton.rx.tap.bind(onNext: {
            self.delegate?.homeViewControllerDidTouchPush()
        }).disposed(by: disposeBag)
    }
    
    func addModalButton(){
        modalButton = UIButton(type: .system)
        modalButton.setTitle("Modal", for: .normal)
        self.view.addSubview(modalButton)
        
        modalButton.rx.tap.bind(onNext: {
            self.delegate?.homeViewControllerDidTouchModal()
        }).disposed(by: disposeBag)
    }
    
    func addSearchButton(){
        searchButton = UIButton(type: .system)
        searchButton.setTitle("Search", for: .normal)
        self.view.addSubview(searchButton)
        
        searchButton.rx.tap.bind(onNext: {
            self.delegate?.homeViewControllerDidTouchSearch()
        }).disposed(by: disposeBag)
    }
    
    func setupButtonConstraints(){
        self.pushButton.translatesAutoresizingMaskIntoConstraints = false
        self.pushButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -50).isActive = true
            self.pushButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        self.modalButton.translatesAutoresizingMaskIntoConstraints = false
        self.modalButton.topAnchor.constraint(equalTo: self.pushButton.bottomAnchor, constant: 30).isActive = true
        self.modalButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        self.searchButton.translatesAutoresizingMaskIntoConstraints = false
        self.searchButton.topAnchor.constraint(equalTo: self.modalButton.bottomAnchor, constant: 30).isActive = true
        self.searchButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
}
