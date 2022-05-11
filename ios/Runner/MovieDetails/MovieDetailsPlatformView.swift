//
//  MovieDetailsVC.swift
//  Runner
//
//  Created by Lobna Shaheen on 10/05/2022.
//

import Flutter
import UIKit
import Kingfisher
import SwiftUI

class MovieDetailsPlatformView: NSObject, FlutterPlatformView {
    private var _view: UIView = UIView()
    var movieId: String = "-1"
    
    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
  
        let movieID = args as? Dictionary<String, String>
        if (movieID != nil)
        {movieId = movieID!["movieID"]!}
        super.init()
        createErrorView(view: _view)
    }

    func view() -> UIView {
        let movieView = MovieDetailsView()
        print(movieId)
        if (movieId == "-1"){
            return _view
        }
        getMovieDetails(id: movieId) { response, error in
            if error != nil {
                print(error!.localizedDescription)
            }else{
                print(response!.backdropPath)
                movieView.movieImage.kf.setImage(with: .network(URL(string: "https://image.tmdb.org/t/p/w500\(response!.backdropPath)")!))
                movieView.movieNameLabel.text = response?.title
//                movieView.movieGenreLabel.text = response?.genres
//                movieView.movieDescLabel.text = response?.overview
                
            }}
        return movieView
    }
    
    func createErrorView(view _view: UIView){
        _view.backgroundColor = UIColor.red
        let nativeLabel = UILabel()
        nativeLabel.text = "Error Loading Data"
        nativeLabel.textColor = UIColor.white
        nativeLabel.textAlignment = .center
        nativeLabel.frame = CGRect(x: 100, y: 100, width: 180, height: 48.0)
        _view.addSubview(nativeLabel)
    }
}
