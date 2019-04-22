//
//  CategoryCell.swift
//  App Store
//
//  Created by Matheus Mariano on 13/11/18.
//  Copyright © 2018 Matheus Mariano. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Best New Apps"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    let dividerLineView: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        line.translatesAutoresizingMaskIntoConstraints = false
        
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(appsCollectionView)
        addSubview(dividerLineView)
        
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: "\(AppCell.self)")
        
        addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-14-[l0]|",
                options: NSLayoutConstraint.FormatOptions(),
                metrics: nil,
                views: [
                    "l0": titleLabel
                ]
            )
        )
        
        addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|[v0]|",
                options: NSLayoutConstraint.FormatOptions(),
                metrics: nil,
                views: [
                    "v0": appsCollectionView
                ]
            )
        )
        
        addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-14-[v0]|",
                options: NSLayoutConstraint.FormatOptions(),
                metrics: nil,
                views: [
                    "v0": dividerLineView
                ]
            )
        )
        
        addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|[l0(30)][v0][v1(0.5)]|",
                options: NSLayoutConstraint.FormatOptions(),
                metrics: nil,
                views: [
                    "l0": titleLabel,
                    "v0": appsCollectionView,
                    "v1": dividerLineView
                ]
            )
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(AppCell.self)", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(integerLiteral: AppCell.iconSize), height: frame.height - 38.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
}
