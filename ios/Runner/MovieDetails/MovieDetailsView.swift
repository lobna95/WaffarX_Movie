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
    
    
    let spinner = UIActivityIndicatorView(style: .whiteLarge)
    
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
        
        // Add Nave Bar
//        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: 400))
//        navBar.barTintColor = UIColor(red: 37, green: 150, blue: 190, alpha: 0.0)
//        navBar.titleTextAttributes = [.foregroundColor: UIColor.white]
//        let naveItem = UINavigationItem(title: "Movie Details")
//        naveItem.backBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: nil, action: nil)
//
//        navBar.setItems([naveItem], animated: true)
//        viewFromXib.addSubview(navBar)
        
        // Add Loading Indicator
        spinner.startAnimating()
        spinner.frame = CGRect(x: 100, y: 350, width: 180, height: 48.0)
        viewFromXib.addSubview(spinner)

        
        addSubview(viewFromXib)
    }
}
