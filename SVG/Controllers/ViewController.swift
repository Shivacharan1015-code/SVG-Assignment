//
//  ViewController.swift
//  SVG
//
//  Created by Shivacharan Reddy on 05/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let generateButton: UIButton = {
       
        let button = UIButton(configuration: .filled())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Generate Dogs", for: .normal)
        button.backgroundColor = UIColor(named: "buttonColor")
        button.layer.cornerRadius = 30
        return button
    }()
    
    private let recentButton: UIButton = {
       
        let button = UIButton(configuration: .filled())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Recently Generated Dogs", for: .normal)
        button.backgroundColor = UIColor(named: "buttonColor")
        button.layer.cornerRadius = 30
        return button
    }()
    
    private let introLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Random Dog Generator!"
        label.textColor = .label
        label.font = .preferredFont(forTextStyle: .title1)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(introLabel)
        
        view.addSubview(recentButton)
        recentButton.addAction(UIAction(handler: { _ in
            self.goToRecentlySavedScreen()
        }), for: .touchUpInside)
        
        view.addSubview(generateButton)
        generateButton.addAction(UIAction(handler: { _ in
            self.goToGenerateDogsScreen()
        }), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            introLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            introLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
        
            recentButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            recentButton.heightAnchor.constraint(equalToConstant: 50),
            recentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            generateButton.bottomAnchor.constraint(equalTo: recentButton.topAnchor, constant: -20),
            generateButton.heightAnchor.constraint(equalToConstant: 50),
            generateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func goToGenerateDogsScreen() {
        
        self.navigationController?.pushViewController(GenerateNewDogsViewController(), animated: true)
    }
    
    func goToRecentlySavedScreen() {
        
        self.navigationController?.pushViewController(RecentlySavedViewController(), animated: true)
    }

}

