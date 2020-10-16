//
//  ImageLoader.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/16/20.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

// prototype -  should using another ImageLoader had been published to effect
extension UIImageView {
    func loadImage(withUrl urlString : String) {
        let url = URL(string: urlString)
        if url == nil {
            self.image = nil
            return
        }
        self.image = nil

        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            return
        }

        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }

            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                }
            }

        }).resume()
    }
}
