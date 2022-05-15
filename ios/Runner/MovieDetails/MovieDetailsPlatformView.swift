//
//  MovieDetailsVC.swift
//  Runner
//
//  Created by Lobna Shaheen on 10/05/2022.
//

import Flutter
import UIKit
import Kingfisher

class MovieDetailsPlatformView: NSObject, FlutterPlatformView {
    var spinner = UIActivityIndicatorView()
    private var _view: UIView = UIView()
    private var _movieId: String = "-1"
    private var _movieView : MovieDetailsView
    
    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _movieView = MovieDetailsView.init(frame: frame)
        
        
        let movieID = args as? Dictionary<String, String>
        if (movieID != nil)
        {_movieId = movieID!["movieID"]!}
        
        super.init()
        if _movieId == "-1"{
            createErrorView(view: _view)
        }else{
            createMovieDetailsView()
        }
    }
    
    func view() -> UIView {
        return _movieView
    }
    
    func createErrorView(view _view: UIView){
        _view.backgroundColor = UIColor.red
        let nativeLabel = UILabel()
        nativeLabel.text = "Error Loading Data"
        nativeLabel.textColor = UIColor.white
        nativeLabel.textAlignment = .center
        nativeLabel.frame = CGRect(x: 200, y: 100, width: 180, height: 48.0)
        _view.addSubview(nativeLabel)
    }
    
    func createMovieDetailsView(){
        getMovieDetails(id: _movieId) { response in
            
            guard let movie = response else{
                print("Second error")
                return
            }
            var movieGenre = ""
            for _genre in movie.genres{
                movieGenre = "\(movieGenre)\(_genre.name) "
            }
            self._movieView.movieNameLabel.text = movie.title
            self._movieView.movieGenreLabel.text = "Genre: \(movieGenre)"
            self._movieView.movieDescLabel.text = "\(movie.overview ?? "No Description is avaliable for this movie")"
            self._movieView.movieDescL.text = "Description"
            guard let imageName = movie.backdropPath ?? movie.posterPath else{
                self._movieView.movieImage.image = UIImage(named: "no-poster-available")
                return
            }
            self._movieView.movieImage.kf.setImage(with: .network(URL(string: "https://image.tmdb.org/t/p/w500\(imageName)")!))
            self._movieView.spinner.stopAnimating()
            self._movieView.spinner.hidesWhenStopped = true
        }
    }
}
