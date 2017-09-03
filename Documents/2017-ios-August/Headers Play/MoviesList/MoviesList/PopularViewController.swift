//
//  ViewController.swift
//  MoviesList
//
//  Created by mobile dev3 on 8/27/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

class PopularViewController: BaseViewController, NetworkManagerDelegate , UICollectionViewDelegate, UICollectionViewDataSource {
    
    let rest : NetworkManager = NetworkManager()
    var viewActivity = ProgressUtils()
    var arrayofData:[MovieModel] = [MovieModel]()
    
    @IBOutlet weak var collectionView: UICollectionView!
     let gridFlowLayout = GridFlowLayout()
    
    @IBOutlet weak var tableView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setNaviationBar(headline: "Popular")
        rest.initwith()
        rest.restDelegate = self
         viewActivity.showActivityIndicator(self.view);
       
        rest.getContactDetails(Utils.BASE_URL +  "movie/popular?api_key=" + Utils.API_KEY  , userToken: ActivityConstants.INT_POPULAR)
        collectionView.collectionViewLayout = gridFlowLayout
    }
    
      
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayofData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath as IndexPath) as! PopularCell
      cell.iconView.setImageFromURl(stringImageUrl:  Utils.IMAGE_URL+(arrayofData[indexPath.row].poster_path)!)
       cell.bgView.cardView()
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var homeVC : MovieDetailsViewController!
        homeVC  = self.storyboard!.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        homeVC.imageStr = Utils.IMAGE_URL+(arrayofData[indexPath.row].poster_path)!
        homeVC.movieModel = arrayofData[indexPath.row]
        self.present(homeVC, animated: false, completion: nil)
    }
    
        
    
    
    func ApiResponsegetArrived(_ Response:AnyObject, Token:String){
        viewActivity.hideActivityIndicator()
        if(Token == ActivityConstants.INT_POPULAR){
            print("Token is \(Token) And Response is \(Response)")
            if let detailsjson = Response["results"] as? [[String: AnyObject]] {
                for popularModel in detailsjson {
                    if let name = popularModel["title"] as? String  {
                        print(name)
                        let model =  MovieModel(vote_count: (popularModel["vote_count"] as? Int)!, id: (popularModel["id"] as? Int)!, video: (popularModel["video"] as? Bool)!, vote_average: (popularModel["vote_average"] as? Float)!, title: (popularModel["title"] as? String ?? ""), popularity: (popularModel["popularity"] as? Double)!, poster_path: (popularModel["poster_path"] as? String) ?? "", original_language: (popularModel["original_language"] as? String ?? ""), original_title: (popularModel["original_title"] as? String ?? ""), backdrop_path: (popularModel["backdrop_path"] as? String ?? ""), overview: (popularModel["overview"] as? String ?? ""), release_date: (popularModel["release_date"] as? String ?? ""))
                     arrayofData.append(model)
                    }
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            
        }
    }
    
}

