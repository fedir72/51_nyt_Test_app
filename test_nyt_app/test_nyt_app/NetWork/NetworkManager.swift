//
//  NetworkManager.swift
//  test_nyt_app
//
//  Created by fedir on 10.06.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

let urlStr = "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=MenHealth&api-key=LucVQN80Hcs1DWf37dMmFc2XtpHfZovV"
   


import Foundation

class NetworkManager {
    
    private init () {}
    static let shared: NetworkManager = NetworkManager()
    
    func getdArticles(theme: String , result: @escaping ((OfferModel?) -> ())) {
  
//      var urlComponents = URLComponents()
//        urlComponents.scheme = "https"
//        urlComponents.host = "api.nytimes.com"
//        urlComponents.path = "/svc/search/v2/articlesearch.json"
//        urlComponents.queryItems = [URLQueryItem(name: "q", value:"TheNewYorkTimesfq=news_desk:(\(theme))"),
//                                    URLQueryItem(name: "api_key", value: "LucVQN80Hcs1DWf37dMmFc2XtpHfZovV")]
//        var request = URLRequest(url: urlComponents.url!)
//        request.httpMethod = "GET"
        
        let url = "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=TheNewYorkTimesfq=news_desk:(Sports)&api-key=LucVQN80Hcs1DWf37dMmFc2XtpHfZovV"
        let task = URLSession(configuration: .default)
        task.dataTask(with: URL(string: url)!) { (data, response, error) in
            if error == nil {
                let decoder = JSONDecoder()
                var decodeOfferModel: OfferModel?
                
                if data != nil {
                    decodeOfferModel = try? decoder.decode(OfferModel.self, from: data!)
                }
                //передаем в комплишн
                result(decodeOfferModel)
                
            }else{
                print(error as Any)
            }
        }.resume()
    }
        
    
}



