//
//  RecentlySavedViewController.swift
//  SVG
//
//  Created by Shivacharan Reddy on 05/01/24.
//

import UIKit

class RecentlySavedViewController: UIViewController {
    
    private let savedCollectionView: UICollectionView = {
       
        let view = UICollectionView(frame: .zero, collectionViewLayout: RecentlySavedViewController.createCompositionalLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return view
    }()
    
    private let clearCacheButton: UIButton = {
       
        let button = UIButton(configuration: .filled())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Clear", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "My Recently Generated Dogs"
        
        view.addSubview(savedCollectionView)
        savedCollectionView.delegate = self
        savedCollectionView.dataSource = self
        
        view.addSubview(clearCacheButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
        
            savedCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            savedCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            savedCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            savedCollectionView.heightAnchor.constraint(equalToConstant: view.bounds.height / 2),
            
            clearCacheButton.topAnchor.constraint(equalTo: savedCollectionView.bottomAnchor, constant: 16),
            clearCacheButton.heightAnchor.constraint(equalToConstant: 50),
            clearCacheButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    static func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        return UICollectionViewCompositionalLayout(section: section)
    }

}

extension RecentlySavedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .gray
        return cell
    }
}
