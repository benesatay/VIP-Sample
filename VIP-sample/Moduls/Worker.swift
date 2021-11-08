//
//  Worker.swift
//  VIP-sample
//
//  Created by Bahadır Enes Atay on 27.10.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class Worker {
    func getSeries(_ req: SeriesRequest, onSuccess: @escaping (SeriesResponse) -> Void, onError: @escaping (Error) -> Void) {
        RequestManager.get(.series, SeriesResponse.self, req.toJSON()) { response, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    onError(error!)
                    return }
                if let response = response {
                    onSuccess(response)
                } else {
                    onError(APIError.dataNotFound)
                }
            }
        }
    }
}
 

enum APIError: LocalizedError {
    case dataNotFound
    
    var description: String {
        switch self {
        case .dataNotFound:
            return "Data Not Found"
        default:
            return "Unexpected!"
        }
    }
    
    
}
