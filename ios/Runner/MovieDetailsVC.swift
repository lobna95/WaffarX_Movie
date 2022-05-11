//
//  MovieDetailsVC.swift
//  Runner
//
//  Created by Lobna Shaheen on 10/05/2022.
//

import Flutter
import UIKit

class MovieDetailsVCFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return MovieDetailsVC(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }
}

class MovieDetailsVC: NSObject, FlutterPlatformView {
    private var _view: UIView

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        super.init()
        
//        customNavView = CustomNavigationView()
//        movieView = Bundle.main.loadNibNamed("MovieDetailsView", owner: self, options: nil)?[0] as! MovieDetailsView
//        movieView.frame = CGRect(x: 0, y: 20, width: 320, height: 54)
//        _view.addSubview(movieView)
        
        //Get all views in the xib
//        let allViewsInXibArray = Bundle.main.loadNibNamed("MovieDetailsView", owner: self)

        //If you only have one view in the xib and you set it's class to MyView class
//        let movieView = allViewsInXibArray?.first as! MovieDetailsView
        
        
        // iOS views can be created here
//        self.view().addSubview(movieView)
//        _view.addSubview(movieView)
//        movieView.frame = self._view.bounds

        createNativeView(view: _view)
    }

    func view() -> UIView {
        return _view
    }

    func createNativeView(view _view: UIView){
        _view.backgroundColor = UIColor.red
        getMovieDetails(id: "453395") { response, error in
            if error != nil {
                print(error?.localizedDescription)
            }else{
                let nativeLabel = UILabel()
                nativeLabel.text = response?.title
                nativeLabel.textColor = UIColor.white
                nativeLabel.textAlignment = .center
                nativeLabel.frame = CGRect(x: 100, y: 100, width: 180, height: 48.0)
                _view.addSubview(nativeLabel)
            }
        }
    }
}
