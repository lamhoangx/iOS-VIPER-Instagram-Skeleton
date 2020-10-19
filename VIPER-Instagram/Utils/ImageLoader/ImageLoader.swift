//
//  ImageLoader.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/16/20.
//

import Foundation
import UIKit



class ImageLoader {
    static let shared = ImageLoader()
    
    private let imageCache = NSCache<NSString, UIImage>()
    private var imageRequestHolder = [NSString: [UIImageView]]()
    private let imageDispatchQueue = DispatchQueue(label: "instagram-skeleton-imageloader")
    
    private init() {
        imageCache.countLimit = 10
        imageCache.totalCostLimit = 52428800 // 50MB
        
    }
    
    func loadImage(withUrl urlString: NSString, target imageView: UIImageView) {
        let url = URL(string: urlString as String)
        if url == nil {
            imageView.image = nil
            return
        }
        
        imageDispatchQueue.async { [self] in
            if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
                DispatchQueue.main.async {
                    imageView.image = cachedImage
                }
                return
            }
            
            if let pendingQueue = imageRequestHolder[urlString] {
                if pendingQueue.contains(imageView) {
                    return
                }
                imageRequestHolder[urlString]!.append(imageView)
                return
            } else {
                imageRequestHolder[urlString] = [imageView]
            }
            DispatchQueue.main.async {
                imageView.image = nil
            }
            
            
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let image = downsampleImage(at: data!, maxSize: 1024) {
                    self.imageDispatchQueue.async { [self] in
                        imageCache.setObject(image, forKey: urlString)
                        if let queueImgView = imageRequestHolder[urlString] {
                            for item in queueImgView {
                                DispatchQueue.main.async {
                                    item.image = image
                                }
                            }
                        }
                        imageRequestHolder.removeValue(forKey: urlString)
                    }
                } else {
                    imageRequestHolder.removeValue(forKey: urlString)
                }
                
            }).resume()
            
        }
    }
    
    func downsampleImage(at data:Data, maxSize:Float) -> UIImage? {
        let sourceOptions = [kCGImageSourceShouldCache:false] as CFDictionary
        let source = CGImageSourceCreateWithData(data as CFData, sourceOptions)!
        let downsampleOptions = [kCGImageSourceCreateThumbnailFromImageAlways:true,
                                 kCGImageSourceThumbnailMaxPixelSize:maxSize,
                                 kCGImageSourceShouldCacheImmediately:true,
                                 kCGImageSourceCreateThumbnailWithTransform:true
        ] as CFDictionary
        
        guard let downsampledImage = CGImageSourceCreateThumbnailAtIndex(source, 0, downsampleOptions) else { return nil }
        
        return UIImage(cgImage: downsampledImage)
    }
}

// prototype -  should using another ImageLoader had been published to effect
extension UIImageView {
    func loadImage(withUrl urlString : String) {
        ImageLoader.shared.loadImage(withUrl: urlString as NSString, target: self)
    }
}
