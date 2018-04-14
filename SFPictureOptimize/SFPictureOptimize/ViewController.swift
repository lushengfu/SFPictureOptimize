//
//  ViewController.swift
//  SFPictureOptimize
//
//  Created by happy on 2018/4/14.
//  Copyright © 2018年 happy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rect = CGRect(x: 0, y: 0, width: 160, height: 160)
        
        let imgView = UIImageView(frame: rect)
        
        imgView.center = view.center
        
        view.addSubview(imgView)
        
        let image = #imageLiteral(resourceName: "avatar_default_big")
        
        
        imgView.image =  clipCircleAvatarImage(image: #imageLiteral(resourceName: "avatar_default_big"), size: image.size)
        
//        imgView.backgroundColor = UIColor.red
        
    }
    
    private func avatarImage(image: UIImage, size: CGSize) -> UIImage? {
        
        let rect = CGRect(origin: CGPoint(), size: size)
        // 获取图片的上下文
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        image.draw(in: rect)
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return result
        
    }
    
    // 切圆角图片
    private func clipCircleAvatarImage(image: UIImage, size: CGSize) -> UIImage? {
        
        let rect = CGRect(origin: CGPoint(), size: size)
        // 获取图片的上下文
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        let path = UIBezierPath(ovalIn: rect)
        path.addClip()
        
        image.draw(at: CGPoint())
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return result
        
    }

}

