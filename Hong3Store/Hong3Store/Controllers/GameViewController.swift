//
//  GameViewController.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/03/02.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    private let rootView = AppViewRoot()
    private let sections = ["게임", "무료 게임", "유료 게임"]
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
    
    
}

extension GameViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                PreviewHeader.identifier) as! PreviewHeader
            headerView.titleLabel.text = sections[section]
            return headerView
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
            let cell = tableView.dequeueReusableCell(withIdentifier: TopgrossTableCell.identifier, for: indexPath) as! TopgrossTableCell
            cell.resultArray = itemDict[.freeGame]
            cell.delegate = self
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: TopgrossTableCell.identifier, for: indexPath) as! TopgrossTableCell
            cell.resultArray = itemDict[.paidGames]
            cell.delegate = self
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
}

extension GameViewController: CollectionCellDidSelected {
    func cellTapped(itemId: String, title: String) {
        let detailVC = DetailViewController()
        detailVC.configure(id: itemId, title: title)
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
        self.navigationItem.title = "게임"
        
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
        
        rootView.tableView.register(ReuseHeaderCell.self, forHeaderFooterViewReuseIdentifier: ReuseHeaderCell.identifier)
        rootView.tableView.register(PreviewHeader.self,forHeaderFooterViewReuseIdentifier: PreviewHeader.identifier)
        rootView.tableView.register(TopgrossTableCell.self, forCellReuseIdentifier: TopgrossTableCell.identifier)
        rootView.tableView.register(PreviewTableCell.self, forCellReuseIdentifier: PreviewTableCell.identifier)
    }
    
    private func requestData() {
        DispatchQueue.global().sync { [weak self] in
            guard let self = self else { return }
            for (index, itemKey) in [Constants.EndPoint.newGames, Constants.EndPoint.freeGame, Constants.EndPoint.paidGames].enumerated() {
                RequestHelper.shared.request(method: .get, pagination: .hundred, endPoint: itemKey) { result in
                    switch result {
                    case .success(let data):
                        if let decodeData = try? JSONDecoder().decode(AppStoreModel.self, from: data) {
                            self.itemDict[itemKey] = decodeData.feed.results
                            DispatchQueue.main.async {
                                self.rootView.tableView.reloadSections([index], with: .none)
                            }
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
}
