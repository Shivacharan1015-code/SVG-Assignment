//
//  ImageCollectionViewCell.swift
//  SVG
//
//  Created by Shivacharan Reddy on 05/01/24.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ImageCollectionViewCell"
    
    private let dogImage: UIImageView = {
       
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(dogImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dogImage.frame = contentView.bounds
    }
    
    func configure(data: Data?) {
        
        guard let data = data else { return }
        
        dogImage.image = UIImage(data: data)
    }
}
