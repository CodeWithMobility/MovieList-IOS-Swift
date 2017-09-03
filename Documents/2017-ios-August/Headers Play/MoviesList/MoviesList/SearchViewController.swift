//
//  SearchViewController.swift
//  MoviesList
//
//  Created by mobile dev3 on 8/27/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController, NetworkManagerDelegate,  UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let rest : NetworkManager = NetworkManager()
    var viewActivity = ProgressUtils()
    var arrayofData:[MovieModel] = [MovieModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNaviationBar(headline: "Search")
        
        rest.initwith()
        rest.restDelegate = self
        
        let searchButton = UIButton()
        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.height
        searchButton.setImage(UIImage(named: "search.png"), for: UIControlState())
        searchButton.frame = CGRect(x: 0, y: 0, width: navigationBarHeight, height: navigationBarHeight)
        searchButton.addTarget(self, action: #selector(onSearchButtonPressed(_:)), for: UIControlEvents.touchUpInside)
        let leftNavBarButton = UIBarButtonItem(customView:searchButton)
        self.navigationItem.rightBarButtonItem = leftNavBarButton
    }
    
    
    
    
    
    lazy var searchView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.navigationController!.navigationBar.frame.height))
    
    
    
    
    func onSearchButtonPressed(_ sender : UIButton){
        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.height
        
        let cancelBackButton =  UIButton()
        cancelBackButton.setImage(UIImage(named: "backArrow.png"), for: UIControlState())
        cancelBackButton.frame = CGRect(x: 16, y: 0, width: navigationBarHeight, height: navigationBarHeight)
        cancelBackButton.addTarget(self, action: #selector(onCancelPressed(_:)), for: UIControlEvents.touchUpInside)
        
        let searchBox = UITextField()
        searchBox.backgroundColor = UIColor.white
        searchBox.placeholder = "Search"
        searchBox.frame = CGRect(x: 70, y: 0, width: 300, height: navigationBarHeight)
        searchBox.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        searchView.addSubview(cancelBackButton)
        searchView.addSubview(searchBox)
        
        searchView.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.white
        let leftNavBarButton = UIBarButtonItem(customView:searchView)
        self.navigationItem.rightBarButtonItem = leftNavBarButton
        
        
    }
    
    
    func onCancelPressed(_ sender : UIButton){
        navigationController?.navigationBar.barTintColor = UIColor(hex: "464555")
        setNaviationBar(headline: "Search")
        // Do any additional setup after loading the view.
        // searchBar.placeholder = "Your placeholder"
        let searchButton = UIButton()
        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.height
        searchButton.setImage(UIImage(named: "search.png"), for: UIControlState())
        searchButton.frame = CGRect(x: 0, y: 0, width: navigationBarHeight, height: navigationBarHeight)
        searchButton.addTarget(self, action: #selector(onSearchButtonPressed(_:)), for: UIControlEvents.touchUpInside)
        let leftNavBarButton = UIBarButtonItem(customView:searchButton)
        self.navigationItem.rightBarButtonItem = leftNavBarButton
        
    }
    func textFieldDidChange(textField: UITextField) {
        let updatedString = textField.text!
        if (updatedString.characters.count > 3) {
            let wholeurl = Utils.BASE_URL +  "search/movie?api_key=" + Utils.API_KEY + "&query=" + updatedString
            let desc =     wholeurl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            rest.getContactDetails(desc! , userToken: ActivityConstants.INT_SEARCH)
        }
        
        
    }
    
    func ApiResponsegetArrived(_ Response:AnyObject, Token:String){
        
        if(Token == ActivityConstants.INT_SEARCH){
            print("Token is \(Token) And Response is \(Response)")
            arrayofData.removeAll()
            if let detailsjson = Response["results"] as? [[String: AnyObject]] {
                for popularModel in detailsjson {
                    if let name = popularModel["title"] as? String  {
                        print(name)
                        let model =  MovieModel(vote_count: (popularModel["vote_count"] as? Int)!, id: (popularModel["id"] as? Int)!, video: (popularModel["video"] as? Bool)!, vote_average: (popularModel["vote_average"] as? Float)!, title: (popularModel["title"] as? String ?? ""), popularity: (popularModel["popularity"] as? Double)!, poster_path: (popularModel["poster_path"] as? String) ?? "", original_language: (popularModel["original_language"] as? String ?? ""), original_title: (popularModel["original_title"] as? String ?? ""), backdrop_path: (popularModel["backdrop_path"] as? String ?? ""), overview: (popularModel["overview"] as? String ?? ""), release_date: (popularModel["release_date"] as? String ?? ""))
                        arrayofData.append(model)
                    }
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayofData.count
    }    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath as IndexPath) as! SearchCell
        cell.iconView.setImageFromURl(stringImageUrl: Utils.IMAGE_URL+(arrayofData[indexPath.row].poster_path)!)
        cell.titleView.text = arrayofData[indexPath.row].title
        cell.popularityTV.text = String(describing: (arrayofData[indexPath.row].popularity!))
        cell.releaseDateTV.text = arrayofData[indexPath.row].release_date
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
    
}
