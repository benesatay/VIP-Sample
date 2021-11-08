//
//  Presenter.swift
//  VIP-sample
//
//  Created by Bahadır Enes Atay on 27.10.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PresentationLogic {
    func presentSeries(response: SeriesList.FetchRequest.Response)
    func presentError(_ error: Error)
}

class Presenter {
    weak var viewController: DisplayLogic?
    
}

extension Presenter: PresentationLogic {

    func presentSeries(response: SeriesList.FetchRequest.Response) {
            let contentList = response.series
                .filter{$0.title != nil && $0.year != nil && $0.poster != nil && $0.imdbID != nil}
                .map{ return SeriesList.FetchRequest.ViewModel.SeriesData(name: $0.title!, year: $0.year!, image: $0.poster!, id: $0.imdbID!) }
            let viewModel = SeriesList.FetchRequest.ViewModel(keyword: response.keyword, seriesData: contentList)
            viewController?.getFetchedSeries(viewModel)
    }
    
    func presentError(_ error: Error) {
        viewController?.presentError(error)

    }
}
