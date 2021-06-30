//
//  FungoCollectionViewCell.swift
//  CollectionView
//
//  Created by Ana Clara Filgueiras Granato on 16/06/21.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .none
        contentView.addSubview(musicName)
        contentView.addSubview(musicArtist)
        contentView.addSubview(musicImage)
        contentView.clipsToBounds = true
    }
    var musicName: UILabel = {
        let label = UILabel()
        label.text = "Nome Música"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.sizeToFit()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        return label
    }()
    var musicArtist: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.sizeToFit()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        label.text = "Nome Artista"
        return label
    }()
    var musicImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    func setUpViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 20),
            self.widthAnchor.constraint(equalToConstant: 100),
            self.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        musicName.frame = CGRect(x: 5, y: contentView.frame.size.height - 30, width: contentView.frame.width - 0, height: 15)
        musicArtist.frame = CGRect(x: 5, y: contentView.frame.size.height - 15, width: contentView.frame.width - 0, height: 15)
        musicImage.frame = CGRect(x: 5, y: 0, width: contentView.frame.width - 10, height: contentView.frame.size.height - 20)
        musicImage.image = UIImage(named: "img1")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configureCells(name: String, artist: String, imageName: String) {
        musicName.text = name
        musicArtist.text = artist
        musicImage.image = UIImage(named: imageName)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        musicName.text = nil
        musicArtist.text = nil
        musicImage.image = UIImage(named: "")
    }
}
