//
//  FlickrSearchServices.swift
//  SwiftFlickrSearch
//
//  Created by suraj poudel on 24/8/19.
//  Copyright © 2019 suraj poudel. All rights reserved.
//

import Foundation
import UIKit

class FlickrSearchServices:NSObject{
    
    func request(_ searchText: String, pageNo: Int, completion: @escaping (Result<Photos?>) -> Void){
        
        //Guard against being a request
        guard let request = FlickrRequestConfig.searchRequest(searchText, pageNo).value else{
            return
        }
        
        NetworkManager.shared.request(request) { (result) in
            switch result{
            case .Success(let responseData):
                if let model = self.processResponse(responseData){
                    if let stat = model.stat,stat.uppercased().contains("OK"){
                        return completion(.Success(model.photos))
                    }else{
                        return completion(.Failure(NetworkManager.errorMessage))
                    }
                }else{
                     return completion(.Failure(NetworkManager.errorMessage))
                }
            case .Failure(let message):
                return completion(.Failure(message))
            case .Error(let error):
                return completion(.Failure(error))
            }
            
          }
        
    }
    
    func processResponse( _ data:Data)->FlickrSearchResults?{
        do{
            let responseModel = try JSONDecoder().decode(FlickrSearchResults.self, from: data)
            return responseModel
        }catch{
            print("Data parsing error: \(error.localizedDescription)")
            return nil
        }
    }
    
    
}
