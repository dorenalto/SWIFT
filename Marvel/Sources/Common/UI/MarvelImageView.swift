//
//  MarvelImageView.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class MarvelImageView: UIImageView {
    var imageUrlString: String?
    
    func downloadImageFrom(withUrl urlString: String) {
        imageUrlString = urlString
        
        let url = URL(string: urlString)
        image = nil
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: url!, completionHandler: { data, _, error in
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: NSString(string: urlString))
                    if self.imageUrlString == urlString {
                        self.image = image
                    }
                }
            }
        }).resume()
    }
}
