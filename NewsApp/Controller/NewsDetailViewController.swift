//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by Omar Thamri on 01/09/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    lazy var newDetailCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    let newDetailCVCellId = "newDetailCVCellId"
    let NewImgCollectionViewCellId = "NewImgCollectionViewCellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = UIColor.white
        view.addSubview(newDetailCV)
        newDetailCV.register(NewDetailCollectionViewCell.self, forCellWithReuseIdentifier: newDetailCVCellId)
        newDetailCV.register(NewImgCollectionViewCell.self, forCellWithReuseIdentifier: NewImgCollectionViewCellId)
    }
    
    func setupConstraints() {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":newDetailCV]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":newDetailCV]))
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func backAction() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.popViewController(animated: true)
    }
    
}

extension NewsDetailViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewImgCollectionViewCellId, for: indexPath) as! NewImgCollectionViewCell
            cell.newsDetailViewController = self
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newDetailCVCellId, for: indexPath) as! NewDetailCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 3)
        }
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height * 2 / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
