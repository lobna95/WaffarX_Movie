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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        let viewFromXib = Bundle.main.loadNibNamed("MovieDetailsView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
}
