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
    var currentImage = [String]()
    public var listOfMusic: [String] {
        return  [String].init(repeating: "Red", count: 10) + [String].init(repeating: "Blank Space", count: 10) + [String].init(repeating: "folklore", count: 10)
    }
//    public var listOfImage: [String] {
//        return  [String].init(repeating: "red", count: 10) + [String].init(repeating: "blank", count: 10) + [String].init(repeating: "folklore", count: 10)
//    }
    var fungoCollection = CollectionView()
    override func loadView() {
        super.loadView()
        //currentImage = listOfImage
        currentSearch = listOfMusic
        setUpNavigationBar()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = fungoCollection
        //fungoCollection.collection.delegate = self
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

extension CollectionViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let myCell = fungoCollection.collection.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell
        {
            let name = currentSearch[indexPath.row]
            myCell.configureCells(name: name, artist: "Taylor Swift", imageName: name)
            return myCell
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
    func setUpNavigationBar(){
        let myColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1.0)
        let buttonColor = UIColor(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1.0)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = myColor
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.searchController = fungoCollection.searchBar
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 74, height: 24)
        button.backgroundColor = buttonColor
        button.setTitle("Selecionar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.layer.cornerRadius = button.frame.size.height/1.8
        button.clipsToBounds = true
        let counterButton = UIBarButtonItem(customView: button)
        let buttons:[UIBarButtonItem] = [counterButton]
        self.navigationItem.rightBarButtonItems = buttons
        title = "Coleção"
    }

}

extension CollectionViewController: UICollectionViewDelegate{
//Ainda será implementado
}

extension CollectionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            currentSearch = listOfMusic
            fungoCollection.collection.reloadData()
            return
        }
        currentSearch = listOfMusic.filter({ name -> Bool in
            guard let text = searchBar.text else { return false }
            return name.contains(text)
        })
        fungoCollection.collection.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        currentSearch = listOfMusic
        fungoCollection.collection.reloadData()
    }
}
