//
//  ImageCollectionViewCell.swift
//  SwiftFlickrSearch
//
//  Created by suraj poudel on 17/8/19.
//  Copyright © 2019 suraj poudel. All rights reserved.
//

import Foundation
import UIKit

class ImageCollectionViewCell:UICollectionViewCell{
    
     @IBOutlet weak var imageView: UIImageView!
    static let nibName = "ImageCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }
    
    
    var model:ImageModel?{
        didSet{
            if let model = model{
                imageView.image = UIImage(named: "placeholder")
                imageView.download(model.imageURL)
               // imageView.image = UIImage(named:"Placeholder")
            }
        }
    }
}
