//
//  AppViewController.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/02/28.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

protocol CollectionCellDidSelected: class {
    func cellTapped(itemId: String, title: String)
}

class AppViewController: UIViewController {
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
        self.navigationController?.navigationBar.prefersLargeTitles = true
//
//        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        UINavigationBar.appearance().largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttr()
        requestData()
        
    }
}

extension AppViewController: UITableViewDelegate, UITableViewDataSource {
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
            cell.resultArray = itemDict[.newApps]
            cell.delegate = self
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TopgrossTableCell.identifier, for: indexPath) as! TopgrossTableCell
            cell.resultArray = itemDict[.topgross]
            cell.delegate = self
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: TopgrossTableCell.identifier, for: indexPath) as! TopgrossTableCell
            cell.resultArray = itemDict[.freeAll]
            cell.delegate = self
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: TopgrossTableCell.identifier, for: indexPath) as! TopgrossTableCell
            cell.resultArray = itemDict[.paidAll]
            cell.delegate = self
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}

extension AppViewController: CollectionCellDidSelected {
    func cellTapped(itemId: String, title: String) {
        let detailVC = DetailViewController()
        detailVC.configure(id: itemId, title: title)
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
        self.navigationItem.title = "앱"
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
            for (index, itemKey) in [Constants.EndPoint.newApps, Constants.EndPoint.topgross, Constants.EndPoint.freeAll, Constants.EndPoint.paidAll].enumerated() {
                RequestHelper.shared.request(method: .get, pagination: .hundred, endPoint: itemKey) { result in
                    switch result {
                    case .success(let data):
                        if let decodeData = try? JSONDecoder().decode(AppStoreModel.self, from: data) {
                            self.itemDict[itemKey] = Array(decodeData.feed.results.dropFirst(1))
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

