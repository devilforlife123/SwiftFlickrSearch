//
//  DataCache.swift
//  SwiftFlickrSearch
//
//  Created by suraj poudel on 24/8/19.
//  Copyright © 2019 suraj poudel. All rights reserved.
//

import Foundation
import UIKit

class DataCache:NSObject{
    
    static let shared = DataCache()
    
    private(set) var cache:NSCache<AnyObject,AnyObject> = NSCache()
    
    
    func getImageFromCache(key:String)->UIImage?{
        if(self.cache.object(forKey: key as AnyObject) != nil){
            return self.cache.object(forKey: key as AnyObject) as? UIImage
        }else{
            return nil
        }
    }
    
    func saveImageToCache(key:String,image:UIImage){
        self.cache.setObject(image, forKey: key as AnyObject)
    }
}
