//
//  FlickrPhoto.swift
//  SwiftFlickrSearch
//
//  Created by suraj poudel on 24/8/19.
//  Copyright © 2019 suraj poudel. All rights reserved.
//

import Foundation

struct FlickrPhoto:Codable{
    
    let farm : Int
    let id : String
    
    let isfamily : Int
    let isfriend : Int
    let ispublic : Int
    
    let owner: String
    let secret : String
    let server : String
    let title: String
    
    
    var imageURL: String {
        
        let urlString = String(format: FlickrConstants.imageURL, farm, server, id, secret)
        return urlString
    }
}
