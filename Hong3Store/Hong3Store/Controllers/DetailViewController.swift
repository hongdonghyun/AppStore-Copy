//
//  DetailViewController.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/03/07.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    private let rootView = DetailViewRoot()
    var itemId: String?
    var detailInfo: InfoResult?
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttr()
//        rootView.tableView.rowHeight = UITableView.automaticDimension
//        rootView.tableView.estimatedRowHeight = UITableView.automaticDimension
    }

}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    // DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        // 타이틀, 새로운기능, 미리보기, 내용, 정보
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTitleCell.identifier, for: indexPath) as? DetailTitleCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    
}

extension DetailViewController {
    private func setAttr() {
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
        rootView.tableView.register(DetailTitleCell.self, forCellReuseIdentifier: DetailTitleCell.identifier)
    }
    
    func requestData() {
        guard let id = itemId else { return }
        RequestHelper.shared.makeParam(id: id)
        RequestHelper.shared.detailRequest(method: .get) { result in
            switch result {
            case .success(let data):
                if let decodeData = try? JSONDecoder().decode(AppInfo.self, from: data) {
                    self.detailInfo = decodeData.results.first
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
