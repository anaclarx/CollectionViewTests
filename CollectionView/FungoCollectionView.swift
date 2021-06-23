//
//  CollectionView.swift
//  CollectionView
//
//  Created by Ana Clara Filgueiras Granato on 17/06/21.
//
import UIKit
import Foundation

class FungoCollectionView: UIView{
    
    
    
    var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let itemSquareSize = UIScreen.main.bounds.width / 3
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 20, left: 35, bottom: 20, right: 35)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.itemSize = CGSize(width: itemSquareSize + 10, height: itemSquareSize + 40 )
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(FungoCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    lazy var searchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search Music"
        searchBar.tintColor = .black
        searchBar.backgroundColor = .systemBackground
        searchBar.barStyle = .default
        searchBar.sizeToFit()
        return searchBar
    }()
    
    init() {
        super.init(frame: .zero)
        self.addSubview(collection)
        self.addSubview(searchBar)
        self.backgroundColor = UIColor.white
        setUpCollectionView()
        setUpsearchBar()
    }
    
    func setUpCollectionView(){
        collection.register(FungoCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            collection.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collection.leftAnchor.constraint(equalTo: self.leftAnchor),
            collection.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
    }
    
    
    func setUpsearchBar(){
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.topAnchor,constant: 80),
            searchBar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            searchBar.widthAnchor.constraint(equalTo: self.widthAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

