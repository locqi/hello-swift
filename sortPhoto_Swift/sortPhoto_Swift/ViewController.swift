//
//  ViewController.swift
//  sortPhoto_Swift
//
//  Created by mac on 14/11/10.
//  Copyright (c) 2014年 LingAn. All rights reserved.
//

import UIKit

let imageWH: CGFloat = 64

class ViewController: UIViewController {
    
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.hashValue
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        adjustImagesPostitionInView(2, isAdd: true)
    }
    
    //MARK: switchColumnsAdjustPosition
    @IBAction func reSortImages(sender: UISegmentedControl) {
        var columns: Int = sender.selectedSegmentIndex + 2
        adjustImagesPostitionInView(columns, isAdd: false)
    }
    
    //MARK: addImagesToView
    func addImagesToView(imagesName: String, x: CGFloat, y: CGFloat){
        var _imageView: UIImageView = UIImageView(frame: CGRectMake(x, y, imageWH, imageWH))
        _imageView.image = UIImage(named: imagesName);
        self.view.addSubview(_imageView)
    }
    
    //MARK: adjustImagesPositionInView
    func adjustImagesPostitionInView(columns: Int, isAdd: Bool){
        let subViewWidth: NSString = "\(self.view.frame.size.width)"
        let imageWidth: NSString = "\(imageWH)"
        let margin: Int = (subViewWidth.integerValue - columns * imageWidth.integerValue) / (columns + 1)
        
        let oneX = margin
        let oneY = 100
        
        for i in 0...10 {
            var col: Int = i % columns
            var row: Int = i / columns
            var x = oneX + col * (margin + imageWidth.integerValue)
            var y = oneY + row * (margin + imageWidth.integerValue)
            let strX: NSString = "\(x)"
            let strY: NSString = "\(y)"
            let imageX: Float = strX.floatValue
            let imageY: Float = strY.floatValue
            let xx: CGFloat = CGFloat(imageX)
            let yy: CGFloat = CGFloat(imageY)
            
            if isAdd {
                var imagesName: NSString = NSString(format: "01%d.png", i)
                addImagesToView(imagesName, x:xx, y:yy)
            }else{
                var child: UIView = self.view.subviews[i + 1] as UIView
                var tempFrame: CGRect = child.frame
                tempFrame.origin = CGPoint(x: xx, y: yy)
                child.frame = tempFrame
            }
        }
    }
}

