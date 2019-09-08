//
//  CategoryListView.swift
//  NewsApp
//
//  Created by Omar Thamri on 31/08/2019.
//  Copyright © 2019 MACBOOK PRO RETINA. All rights reserved.
//

import UIKit

class CategoryListView: UIView {
    
    lazy var categoryListViewCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
       let clvcv = UICollectionView(frame: .zero, collectionViewLayout: layout)
       clvcv.translatesAutoresizingMaskIntoConstraints = false
        clvcv.delegate = self
        clvcv.dataSource = self
        clvcv.backgroundColor = UIColor.init(white: 0.97, alpha: 1)
        return clvcv
    }()
    var homeViewController: HomeViewController?
    let categoryListViewCollectionViewCellId = "categoryListViewCollectionViewCellId"
    let newsCategoryArray = [NewsCategory(image: "apple_card",title: "The biggest differences between Apple's new credit card and most other cards",type: "Finance",author: "Omar Thamri",time: "10:30",detail: "The Apple Card is officially available to consumers across the U.S., which means you can finally get your hands on one of your own. I’ve had the digital version of Apple’s (AAPL) card for a few weeks, and recently began using the physical card, and I’ve found it has a number of features of that make it more appealing than your average credit card. \nThere’s the fantastic interface, the gorgeous physical card, and the fact that the card itself is easy to apply for, set up, and start using. Serious travelers and those looking for high-end card benefits might scoff at the Apple Card’s cash back rewards, but the average consumer is certain to find good use for Apple’s latest major product release. \nI recently upgraded two of my credit cards and began using them more often after having an aversion to cards in general for some time. That’s mostly due to the fact that I’ve always been convinced that I would end up using the card like free money and going into severe debt. \nBut I’ve gotten over that fear, and now have three cards, one of which I use as my primary form of payment. The biggest difference between the Apple Card and most other cards is that the Apple Card is a digital experience first and a physical experience second. That much is clear from the moment you sign up for the card."),NewsCategory(image: "secure",title: "This tech could secure voting machines, but not before 2020",type: "Finance",author: "Omar Thamri",time: "14:20",detail: "LAS VEGAS—A blue box on display here at the DEF CON security conference could make voting machines much more secure—and the circuitry inside might do the same for consumer gadgets. \nBut the technology demonstrated by the Pentagon’s Defense Advanced Research Projects Agency and Portland, Ore-based Galois won’t be ready in time to secure voting machines in the 2020. \nStill, when it does hit the market, the tech could help put a stop to some of the more common cyber attacks on your connected devices. \nThe voting experience of the DARPA/Galois hardware at the Voting Village exhibit might not seem different from that of the obsolete voting machines lined up for inspection nearby. \nYou choose answers to such questions as “Favorite Star Wars Movie” and “Correct Pronunciation of GIF” on a touchscreen, a paper prints out with your choices and a QR code storing them, and you feed that into a scanner. \nBut the circuit board inside a blue frame attached to that scanner incorporates the work of DARPA’s System Security Integration Through Hardware and Firmware project—SSITH for short."),NewsCategory(image: "tim_cook",title: "Apple invites press to September 10th event, confirming iPhone 11 launch date",type: "Technology",author: "Omar Thamri",time: "9:00",detail:"Guess what, Apple fans… it’s official: the new iPhone 11 smartphone lineup will be unveiled on September 10th. Apple just sent invitations to reporters and bloggers for a press conference that will be held at its headquarters in Cupertino, California on Tuesday, September 10th. If that date sounds familiar it’s because BGR pegged it weeks ago as the date on which Apple would be unveiling its next-generation iPhone lineup. As soon as an executive from one of Apple’s carrier partners accidentally revealed that the iPhone 11 series will be released on September 20th, we knew that Apple would make the announcement on the 10th. Wednesday of that week would normally have been Apple’s go-to day for its big iPhone press conference, but that Wednesday happens to fall on September 11th this year. \nApple’s invitations for this year’s iPhone event will undoubtedly be analyzed and picked apart by hardcore Apple fans and bloggers, but the bottom line is that there really isn’t that much left to be revealed next month when Apple finally makes the iPhone 11 series official. Pretty much everything has leaked at this point, though the names of the new phones.")]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = UIColor.red
        addSubview(categoryListViewCollectionView)
        categoryListViewCollectionView.register(CategoryListViewCollectionViewCell.self, forCellWithReuseIdentifier: categoryListViewCollectionViewCellId)
    }
    
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryListViewCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryListViewCollectionView]))
    }
    
}

extension CategoryListView: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsCategoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryListViewCollectionViewCellId, for: indexPath) as! CategoryListViewCollectionViewCell
        cell.newCategory = newsCategoryArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeViewController?.newsCategory = newsCategoryArray[indexPath.item]
        homeViewController?.displayDetailNew()
    }
    
    
    
}
