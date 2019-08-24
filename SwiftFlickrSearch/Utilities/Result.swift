//
//  Result.swift
//  SwiftFlickrSearch
//
//  Created by suraj poudel on 24/8/19.
//  Copyright © 2019 suraj poudel. All rights reserved.
//

import Foundation

enum Result<T>{
    case Success(T)
    case Failure(String)
    case Error(String)
}

enum FlickrRequestConfig{
    
    case searchRequest(String,Int)
    
    var value:Request?{
        switch self {
        case .searchRequest(let searchText, let pageNo):
            let urlString = String(format: FlickrConstants.searchURL, searchText, pageNo)
            let reqConfig = Request.init(requestMethod: .get, urlString: urlString)
            return reqConfig
        }
    }
    
}
