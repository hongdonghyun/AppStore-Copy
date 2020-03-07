//
//  DetailViewController.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/03/07.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var itemId: String?
    var detailInfo: InfoResult?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension DetailViewController {
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
