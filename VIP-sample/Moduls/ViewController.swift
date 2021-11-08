//
//  ViewController.swift
//  VIP-sample
//
//  Created by Bahadır Enes Atay on 27.10.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit

protocol DisplayLogic: AnyObject {
    func getFetchedSeries(_ viewModel: SeriesList.FetchRequest.ViewModel)
    func presentError(_ error: Error)
}

class ViewController: BaseViewController {
    var interactor: BusinessLogic?
    var router: (NSObjectProtocol & RoutingLogic)?
    
    lazy private var collectionView = BaseCollectionView(collectionCell: .movieCell)

    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = Interactor()
        let presenter = Presenter()
        let router = Router()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        self.getSeries("batman")
    }
    
    // MARK: Service
    private func getSeries(_ name: String) {
        let request = SeriesRequest()
        request.series = name
        interactor?.getSeries(request: request)
    }
    
    //MARK: - METHODS
    private func setUI() {
        view.backgroundColor = .white
        collectionView.collectionDelegate = self
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalToSuperview()
        }
    }
}

extension ViewController: DisplayLogic {
    func getFetchedSeries(_ viewModel: SeriesList.FetchRequest.ViewModel) {
        if viewModel.seriesData.count > 0 {
            self.collectionView.updateData(viewModel.seriesData)
        }
     }

    func presentError(_ error: Error) {
        
    }
}

//MARK: - COLLECTION VIEW DELEGATE
extension ViewController: CollectionViewDelegate {
    
}
