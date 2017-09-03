//
//  MovieModel.swift
//  MoviesList
//
//  Created by mobile dev3 on 8/27/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//

import Foundation

struct MovieModel {
    var vote_count: Int?
    var id: Int?
    var video: Bool?
    var vote_average: Float?
    var title: String?
    var popularity: Double?
    var poster_path: String?
    var original_language: String?
    var original_title: String?
    var backdrop_path: String?
    var overview: String?
    var release_date: String?

    init(vote_count: Int, id: Int, video: Bool, vote_average: Float, title: String, popularity: Double, poster_path: String, original_language: String, original_title: String, backdrop_path: String, overview: String, release_date: String) {
        self.vote_count = vote_count
        self.id = id
        self.video = video
        self.vote_average = vote_average
        self.title = title
        self.popularity = popularity
        self.poster_path = poster_path
        self.original_language = original_language
        self.original_title = original_title
        self.backdrop_path = backdrop_path
        self.overview = overview
        self.release_date = release_date
    }
    
}
