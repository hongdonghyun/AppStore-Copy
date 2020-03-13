//
//  AppViewController.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/02/28.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

protocol CollectionCellDidSelected: class {
    func cellTapped(itemId: String, title: String, rank: Int)
}

class AppViewController: UIViewController {
    let requestQueue = DispatchQueue(label: "requestQueue",attributes: .concurrent)
    let requestGroup = DispatchGroup()
    private let rootView = AppViewRoot()
    private let sections = Constants.AppSections
    private var itemDict: [Constants.EndPoint: [AppResult]] = [
        Constants.EndPoint.newApps: [],
        Constants.EndPoint.topgross: [],
        Constants.EndPoint.freeAll: [],
        Constants.EndPoint.paidAll: []
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
        self.navigationItem.title = "앱"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
}

extension AppViewController: UITableViewDelegate, UITableViewDataSource {
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
        case 0: return 0
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
            cell.resultArray = itemDict[.newApps]
            cell.delegate = self
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseTableCell.identifier, for: indexPath) as! ReuseTableCell
            cell.resultArray = itemDict[.topgross]
            cell.delegate = self
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseTableCell.identifier, for: indexPath) as! ReuseTableCell
            cell.resultArray = itemDict[.freeAll]
            cell.delegate = self
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseTableCell.identifier, for: indexPath) as! ReuseTableCell
            cell.resultArray = itemDict[.paidAll]
            cell.delegate = self
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}

extension AppViewController: CollectionCellDidSelected {
    func cellTapped(itemId: String, title: String, rank: Int) {
        let detailVC = DetailViewController()
        detailVC.configure(id: itemId, title: title, rankInt: rank)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension AppViewController: HeaderCellShowMoreBtnSelected {
    func showMoreBtnTapped(currentSection: Int) {
        let nextVC = AppListTableViewController()
        switch currentSection {
        case 1:
            nextVC.configure(appList: itemDict[.topgross] ?? [AppResult](), title: sections[currentSection])
        case 2:
            nextVC.configure(appList: itemDict[.freeAll] ?? [AppResult](), title: sections[currentSection])
        case 3:
            nextVC.configure(appList: itemDict[.paidAll] ?? [AppResult](), title: sections[currentSection])
        default:
            return
        }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension AppViewController {
    private func setAttr() {
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
        
        rootView.tableView.register(ReuseHeaderCell.self, forHeaderFooterViewReuseIdentifier: ReuseHeaderCell.identifier)
        rootView.tableView.register(ReuseTableCell.self, forCellReuseIdentifier: ReuseTableCell.identifier)
        rootView.tableView.register(PreviewTableCell.self, forCellReuseIdentifier: PreviewTableCell.identifier)
    }
    
    private func requestData() {
        rootView.tableView.isHidden = true
        for item in [Constants.EndPoint.newApps, Constants.EndPoint.topgross, Constants.EndPoint.freeAll, Constants.EndPoint.paidAll] {
            requestGroup.enter()
            requestQueue.async(group: requestGroup) { [weak self] in
                guard let self = self else { return }
                RequestHelper.shared.request(method: .get, pagination: .hundred, endPoint: item) { result in
                    switch result {
                    case .success(let data):
                        if let decodeData = try? JSONDecoder().decode(AppStoreModel.self, from: data) {
                            self.itemDict[item] = Array(decodeData.feed.results.dropFirst(1))
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

