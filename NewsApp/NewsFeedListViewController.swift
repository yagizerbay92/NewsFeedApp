//
//  ViewController.swift
//  NewsApp
//
//  Created by Erbay, Yagiz on 7.03.2023.
//

import UIKit
import SafariServices

class NewsFeedListViewController: UIViewController {
    
    private let viewModelProtocol: DenemeProtocol
    
    init(viewModelProtocol: DenemeProtocol) {
        self.viewModelProtocol = viewModelProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private let feedsTableView: UITableView = {
        let temp = UITableView()
        temp.register(NewsFeedTableViewCell.self,
                      forCellReuseIdentifier: CellIdentifiers.newsFeedCellIdentifier.value)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setTableViewSpecs()
        activeConstraints()
        viewModelProtocol.getTopStories()
        viewModelProtocol.subscribeListChange { [weak self] in
            DispatchQueue.main.async {
                self?.feedsTableView.reloadData()
            }
        }
    }
    
    private func setupUI() {
        title = "News"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
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
        return viewModelProtocol.returnNewsFeedListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = feedsTableView.dequeueReusableCell(withIdentifier: CellIdentifiers.newsFeedCellIdentifier.value,
                                                            for: indexPath) as? NewsFeedTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModelProtocol.returnNewsFeedList()[indexPath.row],
                       viewModel: viewModelProtocol)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        feedsTableView.deselectRow(at: indexPath, animated: true)
        let feedItem = viewModelProtocol.returnNewsFeedList()[indexPath.row]
        
        guard let url = URL(string: feedItem.url ?? "") else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        vc.modalPresentationStyle = .automatic
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

