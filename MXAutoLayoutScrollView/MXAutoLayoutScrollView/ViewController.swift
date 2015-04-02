//
//  ViewController.swift
//  MXAutoLayoutScrollView
//
//  Created by 李茂轩 on 15/3/30.
//  Copyright (c) 2015年 limaoxuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageArray = ["guide1","guide2","guide3","guide4"]
        
        
        
        var scollerView = MyScrollView(imageNameArray: imageArray, eachOtherGap: 0, showType: MyScrollViewShowType.horizontal)
       scollerView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        
        let viewDic = ["scollerView":scollerView]
        let svH = "H:|-0-[scollerView(\(screenWidth))]-0-|"
        
        let svV = "V:|-0-[scollerView(\(screenHeight))]"
        
        view.addSubview(scollerView)
        
        setConstraintsWithStringHandVWithCurrentView(svH, svV, view, viewDic)
        
        scollerView.installView()
        
        
        
        
        
        
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

