//
//  UIImageViewExtension.swift
//  Ogr_UIPageViewController5
//
//  Created by teyhan.uslu on 23.09.2021.
//

import UIKit

extension UIImageView{
    func setImage(path:String, isPosterPath:Bool = false) {

        var strUrl = ""
        if(isPosterPath){
            strUrl += "https://image.tmdb.org/t/p/w500/"
        }
        strUrl += path
        self.kf.setImage(with: URL(string: strUrl))
    }
}
