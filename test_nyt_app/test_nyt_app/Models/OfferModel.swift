//
//  OfferModel.swift
//  test_nyt_app
//
//  Created by fedir on 11.06.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation

class OfferModel: Codable {
    
    var status : String?
    var copyright :String?
    var response : Response?
}

class Response: Codable {
    var docs: [Doc]?
}


class Doc: Codable {
     var abstract: String?
     var web_url: String?
     var source: String?
     var headline: HeadLine?
     var news_desk: String
     var section_name: String
     var type_of_material: String?
}

class HeadLine: Codable {
    var main: String?
    var print_headline: String?
}
