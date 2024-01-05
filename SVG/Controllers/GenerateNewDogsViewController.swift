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
    
    private let loadingIndicator: UIActivityIndicatorView = {
        
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Generate Dogs!"
        
        view.addSubview(randomDogImageView)
        
        view.addSubview(generateButton)
        generateButton.addAction(UIAction(handler: { _ in
            self.getRandomDog()
        }), for: .touchUpInside)
        
        view.addSubview(loadingIndicator)
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
            generateButton.heightAnchor.constraint(equalToConstant: 50),
            
            loadingIndicator.centerXAnchor.constraint(equalTo: randomDogImageView.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: randomDogImageView.centerYAnchor),
            loadingIndicator.widthAnchor.constraint(equalToConstant: 50),
            loadingIndicator.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func getRandomDog() {
        
        loadingIndicator.startAnimating()
        
        APICaller.shared.getRandomDogImages { results in
            switch results {
            case .success(let data):
                self.displayImageOfRandomDog(link: data.link)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func displayImageOfRandomDog(link: String) {
        
        APICaller.shared.downloadImage(completion: { results in
            switch results {
            case .success(let image):
                DispatchQueue.main.async {
                    self.randomDogImageView.backgroundColor = .clear
                    self.randomDogImageView.image = image
                    self.loadingIndicator.stopAnimating()
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self.loadingIndicator.stopAnimating()
                }
            }
            
        }, url: link)
    }

}
