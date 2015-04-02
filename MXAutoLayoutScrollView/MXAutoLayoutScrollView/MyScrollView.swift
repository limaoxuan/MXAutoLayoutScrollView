//
//  myScrollView.swift
//  MXAutoLayoutScrollView
//
//  Created by 李茂轩 on 15/3/30.
//  Copyright (c) 2015年 limaoxuan. All rights reserved.
//

import UIKit

public enum MyScrollViewShowType{

    case horizontal
    case vertical



}

class MyScrollView: UIScrollView,UIScrollViewDelegate {

    
 
    
    var isCircle : Bool = false
    
    var showType : MyScrollViewShowType!

    
    var childrenView :  UIView!
    
    var imageNameArray : [String]!
    
    var eachOtherGap : Int = 0
    
    var imageViewsDic : Dictionary<String,UIButton>!
    

    convenience   init(imageNameArray:[String],eachOtherGap:Int,showType:MyScrollViewShowType) {
        self.init()
        
        
        self.imageNameArray = imageNameArray
        self.eachOtherGap = eachOtherGap
        self.showType = showType
        self.delegate = self
        self.pagingEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.bounces = !isCircle
        
        setUpComponet()
        
        
        
        
        
        
    }
    
    func setUpComponet(){
    
        addChildrenView()
        addImageView()
    
    
    }
    
    func addChildrenView(){
    
        childrenView = UIView()
        
        childrenView.setTranslatesAutoresizingMaskIntoConstraints(false)
        addSubview(childrenView)
        //        scrollView.delaysContentTouches
        
        let childViewDic = ["childView":childrenView]
        let childViewLocationH = "H:|-0-[childView(\(imageNameArray.count * Int(screenWidth)))]"
        let childViewLocationV = "V:|-0-[childView(\(screenHeight))]|"
        setConstraintsWithStringWithCurrentView(childViewLocationH, self, childViewDic)
        setConstraintsWithStringWithCurrentView(childViewLocationV, self, childViewDic)

//        self.addSubview(childrenView)

    
    }
    
    func addImageView(){
    
        
        
        imageViewsDic =  Dictionary<String,UIButton>()
        

        for i in 1...imageNameArray.count {
        let imageview = UIButton()
        imageview.userInteractionEnabled = false
        imageview.setTranslatesAutoresizingMaskIntoConstraints(false)
            print(imageNameArray[i-1])
            
            
        imageview.setImage(UIImage(named: imageNameArray[i-1]), forState: UIControlState.Normal)
        imageview.contentMode = UIViewContentMode.ScaleAspectFill
        imageview.tag = i
            
        imageViewsDic.updateValue(imageview, forKey: "image\(i)")
            
            print(imageViewsDic)
            
        imageview.addTarget(self, action: "btnEvent", forControlEvents: UIControlEvents.TouchUpInside)
            
        
            
        childrenView.addSubview(imageview)

        
            
        }
        
        
    
    
    
    
    }
    
    func btnEvent(){
    
    
    
    
    }
    
    func settingImageViewConstrains(){
        
        
        settingVertical(imageViewsDic)
        settingHorizontal(imageViewsDic)
     
        
        
        
    }
    
    func settingVertical(imageViewsDic:Dictionary<String,UIButton>){
    
    
    
        var imagesLocationV = ""
        
        
        print(imageViewsDic)
        
        for i in 1...imageNameArray.count {
            imagesLocationV = "V:|-0-[image\(i)(\(childrenView.frame.height))]-0-|"
            
            print(imagesLocationV)
            
            setConstraintsWithStringWithCurrentView(imagesLocationV, childrenView, imageViewsDic)
            
        }

    
    
    
    }

    func settingHorizontal(imageViewDic:Dictionary<String,UIButton>){
    
    
    
    var imagesLocationH = "H:|-0-"
        
        for i in 1...imageNameArray.count {
        
        
        
            if i != imageNameArray.count{
                imagesLocationH = settingImageslocationH(imagesLocationH, userImageName: "image\(i)", isSetting: true)
                
            }else{
                
                imagesLocationH = settingImageslocationH(imagesLocationH, userImageName: "image\(i)", isSetting: false)
                
            }

        
        
        
        }
        
        print(imagesLocationH)
        
        
     setConstraintsWithStringWithCurrentView(imagesLocationH, childrenView, imageViewDic)
    
    
    
    }
    
    
    func settingImageslocationH(currentImageName : String, userImageName : String,isSetting :Bool)->String
    {
        var newName : String?
        if isSetting {
            newName = currentImageName + "["+userImageName + "(\(self.frame.width))"+"]"+"-0-"
        }else
        {
            
            newName = currentImageName + "["+userImageName + "(\(self.frame.width))"+"]"+"-0-|"
            
        }
        
        
        
        
        
        return newName!
    }
    
        
        
        
    
    
    
    
    func settingScrollerViewContentSize(){
    
        
    var widthRatio   = 1
    var heightRatio  = 1
        
        switch self.showType! {
        
        case .horizontal:
            widthRatio  = imageNameArray.count
            
        case .vertical:
           
            heightRatio = imageNameArray.count
        
        default:
            print("")
        
        
        
        }
        
    self.contentSize = CGSize(width: self.frame.width * CGFloat(widthRatio), height:self.frame.width * CGFloat(heightRatio))
    
    
    
    
    
    }
    
    func installView(){
    
        getSuperViewWidthAndHeight()
        settingScrollerViewContentSize()
        settingImageViewConstrains()
           self.setContentOffset(CGPointMake(self.frame.width, 0), animated:false)
        
    
    }
    
    func getSuperViewWidthAndHeight(){
    
//        layoutIfNeeded()
        self.layoutIfNeeded()
        self.layoutSubviews()
        childrenView.layoutIfNeeded()
        print(childrenView.frame)
        
//        childrenView.frame = self.frame
//        childrenView.backgroundColor = UIColor.redColor()
    
    }
    

    
     func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        
        if isCircle {
        
            
        }
    }
    


    
}
