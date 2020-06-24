//
//  GameViewController.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/03/02.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    let requestQueue = DispatchQueue(label: "requestQueue",attributes: .concurrent)
    let requestGroup = DispatchGroup()
    private let rootView = AppViewRoot()
    private let sections = Constants.GameSections
    private var itemDict: [Constants.EndPoint: [AppResult]] = [
        Constants.EndPoint.newGames: [],
        Constants.EndPoint.freeGame: [],
        Constants.EndPoint.paidGames: []
    ]
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttr()
        requestData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "게임"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
}

extension GameViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0: return nil
        default:
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                ReuseHeaderCell.identifier) as! ReuseHeaderCell
            headerView.configure(title: sections[section], section: section)
            headerView.delegate = self
            return headerView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return UITableView.automaticDimension
        default: return 40
        }
    }
    
    // DataSource
    func numberOfSections(in tableView: UITableView) -> Int { sections.count }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: PreviewTableCell.identifier, for: indexPath) as! PreviewTableCell
            cell.resultArray = itemDict[.newGames]
            cell.delegate = self
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseTableCell.identifier, for: indexPath) as! ReuseTableCell
            cell.resultArray = itemDict[.freeGame]
            cell.delegate = self
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseTableCell.identifier, for: indexPath) as! ReuseTableCell
            cell.resultArray = itemDict[.paidGames]
            cell.delegate = self
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
}

extension GameViewController: CollectionCellDidSelected {
    func cellTapped(itemId: String, title: String, rank: Int, appStoreURL: String) {
        let detailVC = DetailViewController()
        print(appStoreURL)
        detailVC.configure(id: itemId, title: title, rankInt: rank, appStoreURL: appStoreURL)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension GameViewController: HeaderCellShowMoreBtnSelected {
    func showMoreBtnTapped(currentSection: Int) {
        let nextVC = AppListTableViewController()
        switch currentSection {
        case 1:
            nextVC.configure(appList: itemDict[.freeGame] ?? [AppResult](), title: sections[currentSection])
        case 2:
            nextVC.configure(appList: itemDict[.paidGames] ?? [AppResult](), title: sections[currentSection])
        default:
            return
        }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension GameViewController {
    private func setAttr() {
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
        
        rootView.tableView.register(ReuseHeaderCell.self, forHeaderFooterViewReuseIdentifier: ReuseHeaderCell.identifier)
        rootView.tableView.register(ReuseTableCell.self, forCellReuseIdentifier: ReuseTableCell.identifier)
        rootView.tableView.register(PreviewTableCell.self, forCellReuseIdentifier: PreviewTableCell.identifier)
    }
    
    private func requestData() {
        rootView.tableView.isHidden = true
            for itemKey in [Constants.EndPoint.newGames, Constants.EndPoint.freeGame, Constants.EndPoint.paidGames] {
                requestGroup.enter()
                requestQueue.async(group: requestGroup) { [weak self] in
                guard let self = self else { return }
                RequestHelper.shared.request(method: .get, pagination: .hundred, endPoint: itemKey) { result in
                    switch result {
                    case .success(let data):
                        if let decodeData = try? JSONDecoder().decode(AppStoreModel.self, from: data) {
                            self.itemDict[itemKey] = decodeData.feed.results
                        }
                    case .failure(let error):
                        print(error)
                    }
                    self.requestGroup.leave()
                }
            }
        }
        requestGroup.notify(queue: requestQueue) { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.rootView.tableView.reloadData()
                self.rootView.tableView.isHidden = false
            }
        }
    }
}
