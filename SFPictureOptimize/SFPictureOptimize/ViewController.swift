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
        imgView.image =  clipCircleAvatarImage(image: image, size: image.size, backColor: view.backgroundColor)
        
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
    private func clipCircleAvatarImage(image: UIImage, size: CGSize, backColor: UIColor?) -> UIImage? {
        
        let rect = CGRect(origin: CGPoint(), size: size)
        
        // 获取图片的上下文
        UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
        
        // 背景填充
        backColor?.setFill()
        UIRectFill(rect)
        
        let path = UIBezierPath(ovalIn: rect)
        path.addClip()
        
        image.draw(at: CGPoint())
        
        // 绘制内切圆,即边框
        UIColor.darkGray.setStroke()
        path.lineWidth = 3.0
        path.stroke()
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return result
        
    }

}

