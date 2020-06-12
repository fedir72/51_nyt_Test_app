//
//  NetworkManager.swift
//  test_nyt_app
//
//  Created by fedir on 10.06.2020.
//  Copyright © 2020 fedir. All rights reserved.
//
   
import Foundation

class NetworkManager {
    
    private init () {
        self.session = URLSession(configuration: .default)
    }
    
    static let shared = NetworkManager()
    
    var session: URLSession
    
    func getdArticles(categoryName: String , result: @escaping ((OfferModel?) -> ())) {
        
        guard let url = self.url(with: categoryName) else { return result(nil) }
                
        session.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                DispatchQueue.main.async {
                    result(nil)
                }
                print(error?.localizedDescription ?? "Error found")
                return
            }
            
            let decoder = JSONDecoder()
            var decodeOfferModel: OfferModel?
                
            if let data = data {
                decodeOfferModel = try? decoder.decode(OfferModel.self, from: data)
            }
            DispatchQueue.main.async {
                result(decodeOfferModel)
            }
        }.resume()
    }
}

extension NetworkManager {
    
    var urlComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.nytimes.com"
        urlComponents.path = "/svc/search/v2/articlesearch.json"
        return urlComponents
    }
    
    func url(with category: String) -> URL? {
        
        let queryParams: [URLQueryItem] = [
            URLQueryItem(name: "fq", value: "news_desk:(\(category))"),
            URLQueryItem(name: "api-key", value: "LucVQN80Hcs1DWf37dMmFc2XtpHfZovV")
        ]
        
        var components = self.urlComponents
        components.queryItems = queryParams
        return components.url
    }
    
}



