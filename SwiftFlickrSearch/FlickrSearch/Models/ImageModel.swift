//
//  ImageModel.swift
//  SwiftFlickrSearch
//
//  Created by suraj poudel on 24/8/19.
//  Copyright © 2019 suraj poudel. All rights reserved.
//

import Foundation

struct ImageModel{
    
    let imageURL: String
    init(withPhotos photo:FlickrPhoto){
        self.imageURL = photo.imageURL
    }
}
