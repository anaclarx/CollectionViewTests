//
//  CollectionView.swift
//  CollectionView
//
//  Created by Ana Clara Filgueiras Granato on 17/06/21.
//
import UIKit
import Foundation

class CollectionView: UIView {
    var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let itemSquareSize = UIScreen.main.bounds.width / 2.5
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 20, right: 16)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.itemSize = CGSize(width: itemSquareSize + 10, height: itemSquareSize + 40 )
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    lazy var searchBar: UISearchController = {
        let searchBar =  UISearchController(searchResultsController: nil)
        searchBar.accessibilityFrame = CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.width), height: 44)
        searchBar.hidesNavigationBarDuringPresentation = true
        searchBar.dimsBackgroundDuringPresentation = false
        searchBar.searchBar.sizeToFit()
        searchBar.searchBar.returnKeyType = UIReturnKeyType.search
        searchBar.searchBar.placeholder = "Procurar Música"
        return searchBar
    }()
    init() {
        super.init(frame: .zero)
        self.addSubview(collection)
        self.addSubview(searchBar.searchBar)
        self.backgroundColor = UIColor.white
        setUpCollectionView()
    }
    func setUpCollectionView() {
        collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            collection.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collection.leftAnchor.constraint(equalTo: self.leftAnchor),
            collection.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
