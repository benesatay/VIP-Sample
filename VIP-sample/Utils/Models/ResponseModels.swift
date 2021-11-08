//
//  ResponseModels.swift
//  VIP-sample
//
//  Created by Bahadır Enes Atay on 27.10.2021.
//

import ObjectMapper

// MARK: - BASE RESPONSE
class BaseResponse: Mappable, Decodable {
    required init?(map: Map) {  }
    func mapping(map: Map) {
    }
}

// MARK: - BASE CONTENT RESPONSE
class BaseContentResponse: BaseResponse {
    var title, year, imdbID: String?
    var type: String?
    var poster: String?
       
    override func mapping(map: Map) {
        title <- map["Title"]
        year <- map["Year"]
        imdbID <- map["imdbID"]
        type <- map["Type"]
        poster <- map["Poster"]
        year <- map["Year"]
    }
}
