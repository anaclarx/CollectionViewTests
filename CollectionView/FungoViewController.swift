//
//  FungoCollectionView.swift
//  CollectionView
//
//  Created by Ana Clara Filgueiras Granato on 16/06/21.
//

import Foundation
import UIKit

class FungoViewController: UIViewController{
    
    var fungoCollection = FungoCollectionView()
    var fungoCells = FungoCollectionViewCell()
    var currentSearch = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = fungoCollection
        fungoCollection.collection.delegate = self
        fungoCollection.collection.dataSource = self
        fungoCollection.searchBar.delegate = self
        currentSearch = fungoCells.listOfMusic
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension FungoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = fungoCollection.collection.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! FungoCollectionViewCell
        
        myCell.configureCells(name: "Red \(indexPath.row)", artist: "Taylor Swift \(indexPath.row)", imageName: "img1")
        
        
        
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 40)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentSearch = fungoCells.listOfMusic.filter({ name -> Bool in
            guard let text = searchBar.text else {return false}
            return name.contains(text)
        })
        fungoCollection.collection.reloadData()
    }
    
    
}
