//
//  SeriesCell.swift
//  VIP-sample
//
//  Created by Bahadır Enes Atay on 27.10.2021.
//

import UIKit

class BaseCollectionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
    }
}

class SeriesCell: BaseCollectionCell {
    
    lazy private var nameLabel = UILabel()

    public var data: SeriesList.FetchRequest.ViewModel.SeriesData? {
        didSet {
            if let data = data {
                nameLabel.text = data.name
            }
        }
    }

    override func setupViews() {
        setUI()
    }
    
    private func setUI() {
        nameLabel.numberOfLines = 0
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
