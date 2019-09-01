//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by Omar Thamri on 01/09/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = UIColor.white
    }
    
    func setupConstraints() {
        
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
}
