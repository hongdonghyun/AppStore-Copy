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
    private var dataCount = 4
    var itemId: String?
    var detailInfo: InfoResult? {
        willSet {
            if newValue?.releaseNotes != nil {
                self.dataCount = 5
            }
            DispatchQueue.main.async {
                self.rootView.tableView.reloadData()
            }
            print("reload")
        }
    }
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttr()
        requestData()
        
    }
    
}

extension DetailViewController: DetailTableCellMoreBtnSelected {
    func cellTapped() {
        DispatchQueue.main.async {
            self.rootView.tableView.reloadData()
        }
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if dataCount == 4 && indexPath.section == 1{
            return 0
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if dataCount == 4 && indexPath.section == 1{
            return 0
        }
        return 150
    }
    
    // DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        // 타이틀, 새로운기능, 미리보기, 내용, 정보
        return dataCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let info = detailInfo else { return UITableViewCell() }
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTitleCell.identifier, for: indexPath) as? DetailTitleCell else { return UITableViewCell() }
            cell.configure(
                image: info.artworkUrl100,
                title: info.trackName,
                subTitle: info.sellerName,
                average: info.averageUserRating,
                reviewCnt: info.userRatingCount,
                genre:info.genres.first ?? "",
                age: info.contentAdvisoryRating)
            return cell
        case 1:
            if dataCount == 4 { return UITableViewCell() } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailNewFunctionCell.identifier, for: indexPath) as? DetailNewFunctionCell
                    else { return UITableViewCell() }
                cell.delegate = self
                cell.configure(
                    version: info.version,
                    releaseDate: info.currentVersionReleaseDate,
                    releaseNote: info.releaseNotes ?? "")
                return cell
            }
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailPreviewCell.identifier, for: indexPath) as? DetailPreviewCell
                else { return UITableViewCell() }
            cell.configure(imgUrlArray: info.screenshotUrls)
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailDescriptionCell.identifier, for: indexPath) as? DetailDescriptionCell
                else { return UITableViewCell() }
            cell.delegate = self
            cell.configure(
                description: info.appDescription,
                sellerName: info.sellerName)
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailInfoCell.identifier, for: indexPath) as? DetailInfoCell
                else { return UITableViewCell() }
            cell.configure(
                seller: info.sellerName,
                appSize: info.fileSizeBytes,
                category: info.genres,
                OSVersion: info.minimumOSVersion,
                language: info.languageCodesISO2A,
                Advisory: info.contentAdvisoryRating,
                sellerUrl: info.sellerURL ?? ""
            )
            return cell
        default:
            let cell = UITableViewCell()
            cell.textLabel?.text = "\(indexPath)"
            return cell
        }
        
    }
    
    
}

extension DetailViewController {
    private func setAttr() {
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
        rootView.tableView.register(DetailTitleCell.self, forCellReuseIdentifier: DetailTitleCell.identifier)
        rootView.tableView.register(DetailNewFunctionCell.self, forCellReuseIdentifier: DetailNewFunctionCell.identifier)
        rootView.tableView.register(DetailPreviewCell.self, forCellReuseIdentifier: DetailPreviewCell.identifier)
        rootView.tableView.register(DetailDescriptionCell.self, forCellReuseIdentifier: DetailDescriptionCell.identifier)
        rootView.tableView.register(DetailInfoCell.self, forCellReuseIdentifier: DetailInfoCell.identifier)
    }
    
    func requestData() {
        guard let id = itemId else { return }
        RequestHelper.shared.makeParam(id: id)
        RequestHelper.shared.detailRequest(method: .get) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let decodeData = try? decoder.decode(AppInfo.self, from: data) {
                    self.detailInfo = decodeData.results.first
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
