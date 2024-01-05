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
    
    var savedImages: [Data] = []
    
    init() {
        savedImages =  retriveStoredImages()
    }
    
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
                
                if self.savedImages.count < 20 {
                    self.savedImages.append(data)
                    UserDefaults.standard.set(self.savedImages, forKey: "savedImages")
                } else {
                    self.savedImages.removeFirst()
                    self.savedImages.append(data)
                    UserDefaults.standard.set(self.savedImages, forKey: "savedImages")
                }
                completion(.success(image))
            } else {
                completion(.success(UIImage(named: "error")!))
            }
        }
        task.resume()
    }
    
    func retriveStoredImages() -> [Data] {
        
        savedImages = UserDefaults.standard.object(forKey: "savedImages") as? [Data] ?? [Data]()
        
        return savedImages
    }
    
    func clearSavedImages() {
        savedImages = []
        UserDefaults.standard.set(savedImages, forKey: "savedImages")
    }
}
