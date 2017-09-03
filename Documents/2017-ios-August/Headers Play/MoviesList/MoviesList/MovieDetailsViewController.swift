//
//  MovieDetailsViewController.swift
//  MoviesList
//
//  Created by mobile dev3 on 8/27/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit
//import StickyScrollView

class MovieDetailsViewController: UIViewController  {
    var imageStr : String?
     let btnShowMenu = UIButton()
    var movieModel: MovieModel?

    @IBOutlet weak var bannerView: UIImageView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var originalTitleLabel: UILabel!
    
    @IBOutlet weak var votecountLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var revenueLabel: UILabel!
    
    @IBOutlet weak var overViewLabel: UILabel!
    
    @IBOutlet weak var popularityLabel: UILabel!
    
    var previousScrollOffset: CGFloat = 0;
    var updatedValue: CGFloat = 1
    var isScrollable : Bool = false;
    
    @IBOutlet weak var backDropImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
     //   scrollView.delegate = self
        btnShowMenu.setImage(UIImage(named: "backImages"), for: UIControlState())
       // btnShowMenu.setImage(self.defaultMenuImage(), for: UIControlState.highlighted)
        btnShowMenu.frame = CGRect(x: 16, y: 30, width: 30, height: 30)
        btnShowMenu.addTarget(self, action: #selector(onBackButtonPressed(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnShowMenu)
        
        bgView.cardView()
        bannerView.setImageFromURl(stringImageUrl: imageStr!)
        
        titleLabel.text = movieModel?.title
        releaseDateLabel.text = "Release Date: " + (movieModel?.release_date)!
        originalTitleLabel.text = "Original Title: " + (movieModel?.original_title)!
        votecountLabel.text =   String(describing: (movieModel?.vote_count)!)
       // budgetLabel.text = String(describing: (movieModel?.bu)!)
        // voteAverageLabel.text = String(describing: (movieModel?.vote_average)!)
        overViewLabel.text = movieModel?.overview
        backDropImage.setImageFromURl(stringImageUrl: Utils.IMAGE_URL+(movieModel?.backdrop_path)!)
        popularityLabel.text = String(describing: (movieModel?.popularity)!)
        

    }
    
    func onBackButtonPressed(_ sender : UIButton){
        
        self.dismiss(animated: false, completion: nil)
    }
    
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//      
//        
//        let scrollDiff = scrollView.contentOffset.y - self.previousScrollOffset
//        let absoluteTop: CGFloat = 0;
//        let absoluteBottom: CGFloat = scrollView.contentSize.height - scrollView.frame.size.height;
//        let isScrollingDown = scrollDiff > 0 && scrollView.contentOffset.y > absoluteTop
//        let isScrollingUp = scrollDiff < 0 && scrollView.contentOffset.y < absoluteBottom
//       
//        
//        if isScrollingDown {
//        
//            if(updatedValue > 0 && updatedValue < 50) {
//                 updatedValue += 1
//                 moveAnimationDown(value: updatedValue)
//            }
//            
//        } else if isScrollingUp {
//            if(updatedValue > 0 && updatedValue <= 50){
//                 updatedValue -= 1
//                
//                 moveAnimationUp(value: updatedValue)
//            }
//        }
//        
//       // print(updatedValue)
//        
//        
//        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
//            //reach bottom
//            //print("Bottom")
//            isScrollable = true;
//        }
//        
//        if (scrollView.contentOffset.y <= 0){
//            //reach top
//       
//            //reach top
//            isScrollable = false;
//            //print("top")
//        }
//        if (scrollView.contentOffset.y >= 0 && scrollView.contentOffset.y < (scrollView.contentSize.height - scrollView.frame.size.height)){
//            //not top and not bottom
//           // print("topcvcvc")
//        }
//      
//         self.previousScrollOffset = scrollView.contentOffset.y
//
//    }
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//       // print("daragging")
//      
//    }
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//      
////        //self.bannerView.center.y = 1
//        if isScrollable {
//            //updatedValue = 49
//            //self.bannerView.center.y = 120
//            moveanimation1(value: self.bannerView.center.y - 120)
//        } else{
//            //self.bannerView.center.y = 175
//            moveanimation(value: 175 - self.bannerView.center.y)
//            updatedValue = 1
//        }
//        
//    }
//    
//    func moveAnimationDown(value: CGFloat) {
//        self.bannerView.center.y = 175 - value
//    }
//    func moveAnimationUp(value: CGFloat) {
//        self.bannerView.center.y = 175 - value
//    }
//    
//    
//    func moveanimation(value: CGFloat){
//        UIView.animate(withDuration: 0.5, animations: {
//            //self.centerImageView.center.y += self.view.bounds.height
//            self.bannerView.center.y += value
//        }, completion: {finished in
//            
//        })
//    }
//    
//    func moveanimation1(value: CGFloat){
//        UIView.animate(withDuration: 5, animations: {
//            //self.centerImageView.center.y += self.view.bounds.height
//            self.bannerView.center.y += value
//        }, completion: {finished in
//            
//        })
//    }
    
  

}
