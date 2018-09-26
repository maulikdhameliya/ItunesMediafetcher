//
//  UIImageView+Extensions.swift
//  ItunesMediafetcher
//
//  Created by PC on 26/09/18.
//  Copyright © 2018 PC. All rights reserved.
//

import UIKit

extension UIImageView {
    public func imageFromURL(urlString: String) {
        self.image = nil
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if let error = error {
                print(error)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }}
