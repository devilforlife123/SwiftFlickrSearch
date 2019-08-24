//
//  FlickrViewModel.swift
//  SwiftFlickrSearch
//
//  Created by suraj poudel on 17/8/19.
//  Copyright © 2019 suraj poudel. All rights reserved.
//

import Foundation
import UIKit

class FlickrViewModel:NSObject{
    
    
    var showAlert:((String)->Void)?
    var dataUpdated:(()->Void)?
    private var searchText = ""
    private var pageNo = 1
    private var totalPageNo = 1
    private(set) var photoArray = [FlickrPhoto]()
    
    func search(text:String,completion:@escaping ()->()){
        
        searchText = text
        photoArray.removeAll()
        fetchResults(completion:completion)
        
    }
    
    private func fetchResults(completion:@escaping () -> Void){
        
         UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        FlickrSearchServices().request(searchText, pageNo: pageNo) { (result) in
            
            //After the result has been gotten
            
            switch result{
            case .Success(let results):
                if let result = results{
                    self.totalPageNo = result.pages
                    self.photoArray.append(contentsOf: result.photo)
                    self.dataUpdated?()
                }
                completion()
            case .Failure(let message):
                self.showAlert?(message)
                completion()
            case .Error(let error):
                if self.pageNo > 1 {
                    self.showAlert?(error)
                }
                completion()
            }
        }
    }
    
    
}
