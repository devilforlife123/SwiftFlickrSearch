//
//  NetworkManager.swift
//  SwiftFlickrSearch
//
//  Created by suraj poudel on 24/8/19.
//  Copyright © 2019 suraj poudel. All rights reserved.
//

import Foundation
import UIKit


class NetworkManager:NSObject{
    
    static let shared = NetworkManager()
    
    static let errorMessage = "Something went wrong, Please try again later"
    
    static let noInternetConnection = "Please check your Internet connection and try again."
    
    func request(_ request:Request,completion:@escaping (Result<Data>)->()){
        
        guard Reachability.currentReachabilityStatus != .notReachable else{
            
            return completion(.Failure(NetworkManager.noInternetConnection))
        }
        
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            guard error == nil else{
                return completion(.Failure(error!.localizedDescription))
            }
            guard let data = data else {
                return completion(.Failure(error?.localizedDescription ?? NetworkManager.errorMessage))
            }
            guard let stringResponse = String(data: data, encoding: String.Encoding.utf8) else {
                return completion(.Failure(error?.localizedDescription ?? NetworkManager.errorMessage))
            }
            
            return completion(.Success(data))
            
        }.resume()
    }
    
    func downloadImage(_ urlString:String,completion:@escaping (Result<UIImage>)->()){
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        guard let url =  URL.init(string: urlString) else {
            return completion(.Failure(NetworkManager.errorMessage))
        }
        
        guard (Reachability.currentReachabilityStatus != .notReachable) else {
            return completion(.Failure(NetworkManager.noInternetConnection))
        }
        session.downloadTask(with: url) { (url, response, error) in
            do{
                guard let url = url else{
                    return completion(.Failure(NetworkManager.errorMessage))
                }
                let data = try Data(contentsOf: url)
                if let image = UIImage(data: data) {
                    return completion(.Success(image))
                } else {
                    return completion(.Failure(NetworkManager.errorMessage))
                }
            }catch {
                return completion(.Error(NetworkManager.errorMessage))
            }
        }.resume()
    }
}
