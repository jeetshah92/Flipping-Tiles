//
//  ViewController.swift
//  FlippingTiles
//
//  Created by Jeet Shah on 6/8/15.
//  Copyright (c) 2015 Jeet Shah. All rights reserved.
//

import UIKit




class ViewController: UIViewController,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
   var collectionView : UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 120)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView?.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView!.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView!)
       
    // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! UICollectionViewCell
        cell.backgroundColor = UIColor.orangeColor()
        var label = UILabel()
        label.text = "#Happy"
        label.sizeToFit()
        cell.addSubview(label)
        label.frame = CGRect(x:(cell.frame.width - label.frame.width) / 2.0, y:(cell.frame.height - label.frame.height) / 2.0 , width: label.frame.width, height: label.frame.height)
        if(indexPath.row == 8)
        {
            
             var timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector:  Selector("flipCell"), userInfo: nil, repeats: true)
        }
        return cell
    }
    
    
    func flipCell() {
        
        var randNum:Int = random() % (8 - 0) + 0
        var direction:Int = random() % (8-0) + 0
        let indexPath = NSIndexPath(forRow: randNum, inSection: 0)
        
        var randomCell = collectionView!.cellForItemAtIndexPath(indexPath)
        UIView.transitionWithView(randomCell!, duration: 1.5, options:UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            if(direction % 2 == 0)
            {
                randomCell?.transform = CGAffineTransformScale(randomCell!.transform, -1, 1)
            }
            else
            {
                randomCell?.transform = CGAffineTransformScale(randomCell!.transform, 1, -1)
            }
            }, completion: nil)
        
       // println("Random cell:\(randomCell)")
        
    }
    
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath){
        
            println("cell got selected")
        }
    


}

