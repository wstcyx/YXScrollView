//
//  ViewController.swift
//  scrollView
//
//  Created by yx on 16/7/12.
//  Copyright © 2016年 yx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var hScrollView: TKScrollView!
    @IBOutlet weak var vScrollView: TKScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hScrollView.delegate = self
        hScrollView.dataSource = self
        hScrollView.minimumPageAlpha = 0.4
        hScrollView.minimumPageScale = 0.8

        
        
//        vScrollView.delegate = self
//        vScrollView.dataSource = self
//        vScrollView.minimumPageAlpha = 0.4
//        vScrollView.minimumPageScale = 0.8
//        vScrollView.orientation = .Vertical
        
        hScrollView.reloadData()
//        vScrollView.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ViewController: TKScrollViewDelegate, TKScrollViewDataSource {
    func numberOfPagesInTKScrollView(scrollView: TKScrollView) -> Int{
        return 8
    }
    
    func cellForPageAtIndex(scrollView: TKScrollView, index: Int) -> UIView{
        var view = scrollView.dequeueReusableCell() as? UIImageView
        if view == nil {
            let aview = UIImageView()
            aview.layer.cornerRadius = 10
            aview.layer.masksToBounds = true
            view = aview
        }
        view?.image = UIImage(named: "\(index).jpg", inBundle: nil, compatibleWithTraitCollection: nil)
        return view!
    }
    
    
    func sizeForPageInTKScrollView(scrollView: TKScrollView) -> CGSize {
        if scrollView.orientation == .Horizontal {
            return CGSizeMake(280, 260)
        }else{
            return CGSizeMake(240, scrollView.frame.size.height - 200)
        }
    }
    func didScrollToPageAtIndex(scrollView: TKScrollView, index: Int){
        debugPrint("滑动到第 : \(index) 张")
    }
    func didTapPageAtIndex(scrollView: TKScrollView, index: Int){
        debugPrint("点击了第 : \(index) 张")
    }
}