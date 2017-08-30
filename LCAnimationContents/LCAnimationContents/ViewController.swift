//
//  ViewController.swift
//  LCAnimationContents
//
//  Created by 呆仔～林枫 on 2017/8/30.
//  Copyright © 2017年 Lin_Crazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.addSublayer(centerLayer)
    }
    @IBAction func opacity(_ sender: Any) {
        

        centerLayer.add(layerAniamtion(keyPath: "opacity", fromValue: centerLayer, toValue: 0), forKey: "OpacityAnimation")
    }
    @IBAction func backgroundColor(_ sender: Any) {
        
        centerLayer.add(layerAniamtion(keyPath: "backgroundColor", fromValue: centerLayer, toValue: UIColor.gray.cgColor), forKey: "BackgroundColorAnimation")
    }
    @IBAction func corner(_ sender: Any) {
        
        centerLayer.add(layerAniamtion(keyPath: "cornerRadius", fromValue: centerLayer, toValue: 90.0), forKey: "CornerRadiusAnimation")
    }
    @IBAction func border(_ sender: Any) {
        
        corner(Any.self)
        backgroundColor(Any.self)
        centerLayer.add(layerAniamtion(keyPath: "borderWidth", fromValue: centerLayer, toValue: 20.0), forKey: "BorderWidthAnimation")
    }
    @IBAction func shadow(_ sender: Any) {

        centerLayer.add(layerAniamtion(keyPath: "shadowOffset", fromValue: CGSize.init(width: 3, height: 4), toValue: CGSize.init(width: 13, height: 14)), forKey: "ShadowOffsetAnimation")
        centerLayer.shadowOpacity = 1.0
        centerLayer.add(layerAniamtion(keyPath: "shadowColor", fromValue: UIColor.gray.cgColor, toValue: UIColor.yellow.cgColor), forKey: "ShadowColorAnimation")
    }
    @IBAction func path(_ sender: Any) {
        
        let keyframeAni = CAKeyframeAnimation.init(keyPath: "position")
        keyframeAni.duration = 2.4
        keyframeAni.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        let path = UIBezierPath()
        path.addArc(withCenter: self.view.center, radius: 100, startAngle: .pi * 0.5, endAngle: .pi * 2.5, clockwise: true)
        keyframeAni.path = path.cgPath
        centerLayer.add(keyframeAni, forKey: "Path")
    }
    
    func layerAniamtion(keyPath : String,fromValue : Any,toValue : Any) -> CABasicAnimation {
        
        let animation = CABasicAnimation.init(keyPath: keyPath)
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        animation.duration = 1.25
        //动画完成之后保持完成之后的效果
//        animation.isRemovedOnCompletion = false
//        animation.fillMode = kCAFillModeForwards
        return animation
    }
/// lazy
    lazy var centerLayer : CALayer = {
    
        let layer = CALayer()
        layer.bounds = CGRect.init(x: 0, y: 0, width: 230, height: 180)
        layer.position = self.view.center
        layer.backgroundColor = UIColor.orange.cgColor
        return layer
    }()
    
    
    @IBAction func fade(_ sender: Any) {
        
        let animation = CATransition()
        animation.type = kCATransitionFade
        animation.subtype = kCATransitionFromLeft
        animation.duration = 2
        centerLayer.contents = UIImage.init(named: "WoW")?.cgImage
        centerLayer.add(animation, forKey: "TransitionAnimation")
    }
    
    @IBAction func push(_ sender: Any) {
        
        let animation = CATransition()
        animation.type = kCATransitionPush
        animation.subtype = kCATransitionFromLeft
        animation.duration = 2
        centerLayer.contents = UIImage.init(named: "zs")?.cgImage
        centerLayer.add(animation, forKey: "TransitionAnimation")
    }
    
    @IBAction func cube(_ sender: Any) {
        
        let animation = CATransition()
        animation.type = "cube"
        animation.subtype = kCATransitionFromLeft
        animation.duration = 2
        centerLayer.contents = UIImage.init(named: "zs")?.cgImage
        centerLayer.add(animation, forKey: "TransitionAnimation")
    }
    
    @IBAction func page(_ sender: Any) {
    
        let animation = CATransition()
        animation.type = "pageUnCurl"
        animation.subtype = kCATransitionFromLeft
        animation.duration = 2
        centerLayer.contents = UIImage.init(named: "WoW")?.cgImage
        centerLayer.add(animation, forKey: "TransitionAnimation")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

