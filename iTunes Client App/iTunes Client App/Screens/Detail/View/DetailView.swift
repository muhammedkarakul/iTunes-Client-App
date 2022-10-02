//
//  DetailView.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 2.10.2022.
//

import UIKit

final class DetailView: UIView {
    var releaseDate: String? {
        didSet {
            releaseDateLabel.text = "Release Date: \(releaseDate ?? "-")"
        }
    }
    
    var artistName: String? {
        didSet {
            artistNameLabel.text = "Artist Name: \(artistName ?? "-")"
        }
    }
    
    var country: String? {
        didSet {
            countryLabel.text = "Country: \(country ?? "-")"
        }
    }
    
    var genres: String? {
        didSet {
            genresLabel.text = "Genres: \(genres ?? "-")"
        }
    }
    
    private(set) var imageView = UIImageView()
    private var releaseDateLabel = UILabel()
    private var artistNameLabel = UILabel()
    private var countryLabel = UILabel()
    private var genresLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        releaseDateLabel.numberOfLines = .zero
        artistNameLabel.numberOfLines = .zero
        countryLabel.numberOfLines = .zero
        genresLabel.numberOfLines = .zero
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: .screenWidth)
        ])
        
        let stackView = UIStackView(arrangedSubviews: [releaseDateLabel,
                                                       artistNameLabel,
                                                       countryLabel,
                                                       genresLabel])
        stackView.axis = .vertical
        stackView.spacing = 8.0
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32.0),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
