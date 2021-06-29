//
//  FungoCollectionView.swift
//  CollectionView
//
//  Created by Ana Clara Filgueiras Granato on 16/06/21.
//

import Foundation
import UIKit

class CollectionViewController: UIViewController, UISearchControllerDelegate {
    var currentSearch = [String]()
    public var listOfMusic: [String] {
        return  [String].init(repeating: "Red", count: 10) + [String].init(repeating: "Blank Space", count: 10) + [String].init(repeating: "folklore", count: 10)
    }
    var fungoCollection = CollectionView()
    override func loadView() {
        super.loadView()
        currentSearch = listOfMusic
        setUpNavigationBar()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = fungoCollection
        fungoCollection.collection.delegate = self
        fungoCollection.collection.dataSource = self
        fungoCollection.searchBar.searchBar.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = fungoCollection.collection.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CollectionViewCell?
        let name = currentSearch[indexPath.row]
        if let cell = myCell {
            cell.configureCells(name: name, artist: "Taylor Swift \(indexPath.row)", imageName: "img1")
            return cell
        }
        return UICollectionViewCell()
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
        
        guard !searchText.isEmpty else {
            currentSearch = listOfMusic
            fungoCollection.collection.reloadData()
            return
        }
        currentSearch = listOfMusic.filter({ name -> Bool in
            guard let text = searchBar.text else {return false}
            return name.contains(text)
        })
        fungoCollection.collection.reloadData()
    }

    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        currentSearch = listOfMusic
        fungoCollection.collection.reloadData()
    }
    
    func setUpNavigationBar(){
        let myColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1.0)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = myColor
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.searchController = fungoCollection.searchBar
        title = "Meus Colecionáveis"
    }

}

