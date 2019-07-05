//
//  RepoCollectionCell.swift
//  CleanArchitecture
//
//  Created by Tuan Truong on 7/9/18.
//  Copyright © 2018 Sun Asterisk. All rights reserved.
//

import UIKit

final class RepoCollectionCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarURLStringImageView: UIImageView!
    
    func bindViewModel(_ viewModel: RepoViewModel?) {
        if let viewModel = viewModel {
            nameLabel.text = viewModel.name
            avatarURLStringImageView.setImage(with: viewModel.url)
        } else {
            nameLabel.text = ""
            avatarURLStringImageView.image = nil
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarURLStringImageView.image = nil
    }
}
