//
//  ViewController.swift
//  NewsApp
//
//  Created by Erbay, Yagiz on 7.03.2023.
//

import UIKit

class NewsFeedListViewController: UIViewController {
    
    private let viewModel = NewsFeedViewModel()
    
    private let feedsTableView: UITableView = {
        let temp = UITableView()
        temp.register(UITableViewCell.self,
                      forCellReuseIdentifier: "cell")
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setTableViewSpecs()
        activeConstraints()
        viewModel.getTopStories()
    }
    
    private func setupUI() {
        title = "News"
        view.backgroundColor = .systemBackground
        view.addSubview(feedsTableView)
    }
    
    private func activeConstraints() {
        NSLayoutConstraint.activate([
            feedsTableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            feedsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            feedsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            feedsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        ])
    }
    
    private func setTableViewSpecs() {
        feedsTableView.delegate = self
        feedsTableView.dataSource = self
    }
}

extension NewsFeedListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedsTableView.dequeueReusableCell(withIdentifier: "cell",
                                                      for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

