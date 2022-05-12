//
//  MovieDetailsView.swift
//  Runner
//
//  Created by Lobna Shaheen on 11/05/2022.
//

import UIKit

class MovieDetailsView: UIView {
    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    @IBOutlet weak var movieDescLabel: UILabel!
    @IBOutlet weak var movieDescL: UILabel!
    
    
    
    let nativeLabel = UILabel()
    var avliable: Bool = false
    
    private var _view: UIView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        if avliable{
            commonInit()
//        }else{
//            loadingView()
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            commonInit()
    }
    
    func commonInit() {
        let viewFromXib = Bundle.main.loadNibNamed("MovieDetailsView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
        loadingView()
    }
    
    func loadingView(){
        movieDescL.text = ""
        nativeLabel.text = "Loading View"
        nativeLabel.textColor = UIColor.white
        nativeLabel.textAlignment = .center
        nativeLabel.frame = CGRect(x: 100, y: 300, width: 180, height: 48.0)
        _view.bounds = self.bounds
        _view.addSubview(nativeLabel)
        addSubview(_view)
    }
}
