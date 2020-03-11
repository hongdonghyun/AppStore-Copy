//
//  AppListTableViewController.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/10.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class AppListTableViewController: UITableViewController {
    var appList: [AppResult]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.register(AppListTableCell.self, forCellReuseIdentifier: AppListTableCell.identifier)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        appList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = appList[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppListTableCell.identifier, for: indexPath) as? AppListTableCell else { return UITableViewCell() }
        cell.configure(title: item.name, subTitle: item.artistName, imageUrl: item.artworkUrl100, id: item.id, appStoreURL: item.artistURL)
        return cell
    }
    
}

extension AppListTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = appList[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.configure(id: item.id, title: item.name)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension AppListTableViewController {
    func configure(appList appResults: [AppResult], title: String) {
        appList = appResults
        self.navigationItem.title = title
    }
}
