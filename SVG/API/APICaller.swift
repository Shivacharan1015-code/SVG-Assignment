//
//  APICaller.swift
//  SVG
//
//  Created by Shivacharan Reddy on 05/01/24.
//

import Foundation
import UIKit.UIImage

class APICaller {
    
    static let shared = APICaller()
    
    var taskReference: URLSessionDataTask?
    
    func getRandomDogImages(completion: @escaping(Result<RandomDog, Error>) -> Void) {
        
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard error == nil,
                  let data = data else {
                completion(.failure(error!))
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let results = try jsonDecoder.decode(RandomDog.self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func downloadImage(completion: @escaping(Result<UIImage, Error>) -> Void, url: String) {
        
        guard let url = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data,
                  error == nil else { return }
            
            if let image = UIImage(data: data) {
                completion(.success(image))
            } else {
                completion(.success(UIImage(named: "error")!))
            }
        }
        task.resume()
    }
}
