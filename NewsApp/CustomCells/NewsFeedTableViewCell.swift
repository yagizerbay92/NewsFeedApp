//
//  NewsFeedTableViewCell.swift
//  NewsApp
//
//  Created by Erbay, Yagiz on 7.03.2023.
//

import Foundation
import UIKit

class NewsFeedTableViewCell: UITableViewCell {
    
    private let newsTitleLabel: UILabel = {
        let temp = UILabel()
        temp.numberOfLines = 0
        temp.font = .systemFont(ofSize: 22, weight: .semibold)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private let subTitleLabel: UILabel = {
        let temp = UILabel()
        temp.numberOfLines = 0
        temp.font = .systemFont(ofSize: 16, weight: .light)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private let newsImageView: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 6
        temp.layer.masksToBounds = true
        temp.clipsToBounds = true
        temp.backgroundColor = .secondarySystemBackground
        temp.contentMode = .scaleAspectFill
        return temp
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        activateConstraints()
    }
    
    private func setupUI() {
        contentView.addSubview(newsTitleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(newsImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsTitleLabel.text = nil
        subTitleLabel.text = nil
        newsImageView.image = nil
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            newsTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            newsTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            newsTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -150),
            newsTitleLabel.heightAnchor.constraint(equalToConstant: 70),
            
            subTitleLabel.topAnchor.constraint(equalTo: newsTitleLabel.bottomAnchor, constant: 0),
            subTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            subTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -150),
            subTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 100),
            
            newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            newsImageView.leadingAnchor.constraint(equalTo: newsTitleLabel.trailingAnchor, constant: 10),
            newsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            newsImageView.widthAnchor.constraint(equalToConstant: 100),
            newsImageView.heightAnchor.constraint(equalToConstant: 130),
        ])
    }
    
    func configure(with newsFeedModel: Article, viewModel: NewsFeedViewModel) {
        newsTitleLabel.text = newsFeedModel.title
        subTitleLabel.text = newsFeedModel.description
        
        // Image
        newsImageView.image = UIImage(data: viewModel.getImageData())
        
        if let url = URL(string: newsFeedModel.urlToImage ?? "") {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let data = data, error == nil else {
                    return
                }
                viewModel.setImageData(with: data)
                DispatchQueue.main.async {
                    self?.newsImageView.image = UIImage(data: data)
                }
            }.resume()
        }
    }
}
