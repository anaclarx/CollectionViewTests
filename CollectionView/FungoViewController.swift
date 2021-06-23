//
//  FungoCollectionView.swift
//  CollectionView
//
//  Created by Ana Clara Filgueiras Granato on 16/06/21.
//

import Foundation
import UIKit

class FungoCollectionViewDataSource {
    public var listOfMusic: [String] {
       return  [String].init(repeating: "Red", count: 10) + [String].init(repeating: "Blank Space", count: 10) + [String].init(repeating: "folklore", count: 10)
    }
    
}

class FungoViewController: UIViewController{
    
    var fungoCollection = FungoCollectionView()
    var dataSource = FungoCollectionViewDataSource()
    var currentSearch = [String]()
    
    override func loadView() {
        super.loadView()
        currentSearch = dataSource.listOfMusic
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = fungoCollection
        fungoCollection.collection.delegate = self
        fungoCollection.collection.dataSource = self
        fungoCollection.searchBar.delegate = self
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
        
        let name = currentSearch[indexPath.row]
        myCell.configureCells(name: name, artist: "Taylor Swift \(indexPath.row)", imageName: "img1")
    
        
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 40)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentSearch.count
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentSearch = dataSource.listOfMusic.filter({ name -> Bool in
            guard let text = searchBar.text else {return false}
            return name.contains(text)
        })
        fungoCollection.collection.reloadData()
    }
    
    
}

