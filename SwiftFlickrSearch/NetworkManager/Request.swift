//
//  Request.swift
//  SwiftFlickrSearch
//
//  Created by suraj poudel on 24/8/19.
//  Copyright © 2019 suraj poudel. All rights reserved.
//

import Foundation

enum RequestMethod:String{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    
    var value:String{
        return self.rawValue
    }
}

class Request:NSMutableURLRequest{
    
    
    convenience init?(requestMethod: RequestMethod, urlString: String, bodyParams: [String: Any]? = nil) {
        
        guard let url =  URL.init(string: urlString) else {
            return nil
        }
        
        self.init(url: url)
        
        do {
            if let bodyParams = bodyParams {
                let data = try JSONSerialization.data(withJSONObject: bodyParams, options: .prettyPrinted)
                self.httpBody = data
            }
        } catch {
            
        }
        
        self.httpMethod = requestMethod.value
        
        self.addValue("application/json", forHTTPHeaderField: "Content-Type")
    }
}
