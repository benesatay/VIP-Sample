//
//  Interactor.swift
//  VIP-sample
//
//  Created by Bahadır Enes Atay on 27.10.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol BusinessLogic {
    func getSeries(request: SeriesRequest)
}

class Interactor {
    var presenter: PresentationLogic?
 
}

extension Interactor: BusinessLogic {
    func getSeries(request: SeriesRequest) {
        Worker().getSeries(request, onSuccess: { [weak self] series in
            self?.presenter?.presentSeries(response: SeriesList.FetchRequest.Response(series: series.search, keyword: request.series!))
        }, onError: { [weak self] error in
            self?.presenter?.presentError(error)
        })
    }
}
