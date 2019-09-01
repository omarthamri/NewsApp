//
//  ViewController.swift
//  NewsApp
//
//  Created by Omar Thamri on 30/08/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var choiceCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
       let ccv = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        ccv.dataSource = self
        ccv.delegate = self
        ccv.translatesAutoresizingMaskIntoConstraints = false
        ccv.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        return ccv
    }()
    var choicesArray = [Choice(choiceName: "All News",chosen: true,choiceImage: "newspaper"),Choice(choiceName: "Category",chosen: false,choiceImage: "list"),Choice(choiceName: "Bookmark",chosen: false,choiceImage: "bookmark"),Choice(choiceName: "Profile",chosen: false,choiceImage: "user")]
    
    let choiceCellId = "choiceCellId"
    let trendingView: TrendingView = {
       let tv = TrendingView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    lazy var categoryView: CategoryView = {
       let cv = CategoryView()
        cv.homeViewController = self
      cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupView()
        setupConstraints()
    }
    
    func setupNavigationController() {
        navigationItem.title = "NewsApp"
    }
    
    func setupView() {
        view.backgroundColor = UIColor.init(white: 0.97, alpha: 1)
        view.addSubview(trendingView)
        view.addSubview(categoryView)
        view.addSubview(choiceCollectionView)
        choiceCollectionView.register(ChoiceCollectionViewCell.self, forCellWithReuseIdentifier: choiceCellId)
    }
    
    func setupConstraints() {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":choiceCollectionView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(80)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":choiceCollectionView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":trendingView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-64-[v0(300)]-10-[v1]-80-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":trendingView,"v1":categoryView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[v0]-15-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryView]))
    }
    
    func displayDetailNew() {
        let newsDetailViewController = NewsDetailViewController()
        navigationController?.pushViewController(newsDetailViewController, animated: true)
    }
    
    

}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return choicesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: choiceCellId, for: indexPath) as! ChoiceCollectionViewCell
        cell.choice = choicesArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/4, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
        choicesArray = [Choice(choiceName: "All News",chosen: true,choiceImage: "newspaper"),Choice(choiceName: "Category",chosen: false,choiceImage: "list"),Choice(choiceName: "Bookmark",chosen: false,choiceImage: "bookmark"),Choice(choiceName: "Profile",chosen: false,choiceImage: "user")]
        } else if indexPath.item == 1 {
            choicesArray = [Choice(choiceName: "All News",chosen: false,choiceImage: "newspaper"),Choice(choiceName: "Category",chosen: true,choiceImage: "list"),Choice(choiceName: "Bookmark",chosen: false,choiceImage: "bookmark"),Choice(choiceName: "Profile",chosen: false,choiceImage: "user")]
        } else if indexPath.item == 2 {
            choicesArray = [Choice(choiceName: "All News",chosen: false,choiceImage: "newspaper"),Choice(choiceName: "Category",chosen: false,choiceImage: "list"),Choice(choiceName: "Bookmark",chosen: true,choiceImage: "bookmark"),Choice(choiceName: "Profile",chosen: false,choiceImage: "user")]
        } else {
            choicesArray = [Choice(choiceName: "All News",chosen: false,choiceImage: "newspaper"),Choice(choiceName: "Category",chosen: false,choiceImage: "list"),Choice(choiceName: "Bookmark",chosen: false,choiceImage: "bookmark"),Choice(choiceName: "Profile",chosen: true,choiceImage: "user")]
        }
        collectionView.reloadData()
    }
    
    
}

