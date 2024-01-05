//
//  GenerateNewDogsViewController.swift
//  SVG
//
//  Created by Shivacharan Reddy on 05/01/24.
//

import UIKit

class GenerateNewDogsViewController: UIViewController {
    
    private let randomDogImageView: UIImageView = {
       
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .gray
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let generateButton: UIButton = {
       
        let button = UIButton(configuration: .filled())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Generate", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Generate Dogs!"
        
        view.addSubview(randomDogImageView)
        view.addSubview(generateButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
        
            randomDogImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            randomDogImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            randomDogImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            randomDogImageView.heightAnchor.constraint(equalToConstant: view.bounds.height / 2),
            
            generateButton.topAnchor.constraint(equalTo: randomDogImageView.bottomAnchor, constant: 16),
            generateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            generateButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
