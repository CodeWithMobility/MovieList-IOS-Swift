//
//  TopViewController.swift
//  MoviesList
//
//  Created by mobile dev3 on 8/27/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

class TopViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, NetworkManagerDelegate {
    
    
    let rest : NetworkManager = NetworkManager()
    var viewActivity = ProgressUtils()
    var arrayofData:[MovieModel] = [MovieModel]()
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       setNaviationBar(headline: "Top")
        //navigationController?.navigationBar.isTranslucent = false
        rest.initwith()
        rest.restDelegate = self
        // viewActivity.showActivityIndicator(self.view);
        viewActivity.showActivityIndicator(self.view);
        rest.getContactDetails(Utils.BASE_URL +  "movie/top_rated?api_key=" + Utils.API_KEY  , userToken: ActivityConstants.INT_TOP)
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayofData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopTableViewCell", for: indexPath as IndexPath) as! TopTableViewCell
      //  cell.iconView.setDownloadImage(80, height: 80, urlstr: Utils.IMAGE_URL+(arrayofData[indexPath.row].poster_path)!)
         cell.iconView.setImageFromURl(stringImageUrl: Utils.IMAGE_URL+(arrayofData[indexPath.row].poster_path)!)
        
        
        cell.title.text = arrayofData[indexPath.row].title
        cell.popularity.text = String(describing: (arrayofData[indexPath.row].popularity!))
        cell.releaseDate.text = arrayofData[indexPath.row].release_date
           cell.bgView.cardView()
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var homeVC : MovieDetailsViewController!
        homeVC  = self.storyboard!.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        homeVC.imageStr = Utils.IMAGE_URL+(arrayofData[indexPath.row].poster_path)!
        homeVC.movieModel = arrayofData[indexPath.row]
        self.present(homeVC, animated: false, completion: nil)
    }
    
    
    
    func ApiResponsegetArrived(_ Response:AnyObject, Token:String){
        viewActivity.hideActivityIndicator()
        if(Token == ActivityConstants.INT_TOP){
            print("Token is \(Token) And Response is \(Response)")
            if let detailsjson = Response["results"] as? [[String: AnyObject]] {
                for popularModel in detailsjson {
                    if let name = popularModel["title"] as? String  {
                        print(name)
                        let model =  MovieModel(vote_count: (popularModel["vote_count"] as? Int)!, id: (popularModel["id"] as? Int)!, video: (popularModel["video"] as? Bool)!, vote_average: (popularModel["vote_average"] as? Float)!, title: (popularModel["title"] as? String)!, popularity: (popularModel["popularity"] as? Double)!, poster_path: (popularModel["poster_path"] as? String)!, original_language: (popularModel["original_language"] as? String)!, original_title: (popularModel["original_title"] as? String)!, backdrop_path: (popularModel["backdrop_path"] as? String)!, overview: (popularModel["overview"] as? String)!, release_date: (popularModel["release_date"] as? String)!)
                        arrayofData.append(model)
                    }
                }
                
                tableView.reloadData()
            }
            
        }
    }
    
    
}
