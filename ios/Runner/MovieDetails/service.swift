//
//  service.swift
//  Runner
//
//  Created by Lobna Shaheen on 11/05/2022.
//

import Foundation

let baseUrl = "https://api.themoviedb.org/3/movie/"

func getMovieDetails(id: String, completionHandler: @escaping (MovieDetailsModel?) -> Void){
    
    var result: MovieDetailsModel?
    
    let url = "\(baseUrl)\(id)?api_key=fffc11bad42e01fa3032fb760b319219&language=en-US"
    
    let task = URLSession.shared.dataTask(with: URL(string: url)!) { jsonData, response, error in
        guard let data = jsonData, error == nil else{
            print("Failed to retrieve Movie Details")
            completionHandler(nil)
            return
        }
        do{
            result = try JSONDecoder().decode(MovieDetailsModel.self, from: data)
            DispatchQueue.main.async {
                print(result!.title)
                completionHandler(result)
            }
        }
        catch{
            print("Failed to convert \(error)")
            completionHandler(nil)
        }
        
        
    }
    task.resume()
}
