//
//  Models.swift
//  VIP-sample
//
//  Created by Bahadır Enes Atay on 27.10.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum SeriesList {
    // MARK: Use cases
    
    enum FetchRequest {
        struct Request {
            let digitalContentReq: ContentDetailRequest
        }
        
        struct Response {
            let series: [BaseContentResponse]
            let keyword: String
        }
        
        struct ViewModel {
            struct SeriesData {
                let name: String
                let year: String
                let image: String
                let id: String
            }

            let keyword: String
            let seriesData: [SeriesData]
        }
    }
}
