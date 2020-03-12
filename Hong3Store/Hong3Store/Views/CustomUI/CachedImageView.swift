//
//  CachedImageView.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/03/06.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class CachedImageView: UIImageView {
    
    let cache = NSCache<NSString, AnyObject>()
    var URLString: String? {
        willSet {
            downloadImageFrom(urlString: newValue!, contentMode: .scaleAspectFill)
        }
    }
    
    override init(image: UIImage? = nil) {
        super.init(image: image)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.quaternaryLabel.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func downloadImageFrom(urlString: String, contentMode: UIView.ContentMode?) {
        guard let url = URL(string: urlString) else { return }
        self.contentMode = contentMode ?? UIView.ContentMode.scaleAspectFill
        downloadImageFrom(url: url)
    }
    
    private func downloadImageFrom(url: URL) {
        if let cachedImage = cache.object(forKey: url.absoluteString as NSString) as? UIImage {
            self.image = cachedImage
            
        } else {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self else { return }
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    let imageToCache = UIImage(data: data)
                    self.cache.setObject(imageToCache!, forKey: url.absoluteString as NSString)
                    self.image = imageToCache
                }
            }.resume()
            
        }
    }
}
