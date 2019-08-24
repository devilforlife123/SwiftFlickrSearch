//
//  Extension.swift
//  SwiftFlickrSearch
//
//  Created by suraj poudel on 17/8/19.
//  Copyright © 2019 suraj poudel. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func register(nib nibName: String) {
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
}

extension UIImageView{
    
    func download(_ url:String){
        ImageDownloadManager.shared.addOperation(url: url, imageView: self) { [weak self](result, downloadImageImageURL) in
            GCD.runOnMainThread {
                switch result{
                case .Success(let image):
                    self?.image = image
                case .Failure(_):
                    break
                case .Error(_):
                    break
                }
            }
        }
        
    }
}
