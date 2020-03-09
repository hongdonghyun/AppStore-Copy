//
//  DetailDescriptionCell.swift
//  Hong3Store
//
//  Created by Hongdonghyun on 2020/03/09.
//  Copyright © 2020 hong3. All rights reserved.
//

import UIKit

class DetailDescriptionCell: UITableViewCell {
    static let identifier = "DetailDescriptionCell"
    weak var delegate: DetailTableCellMoreBtnSelected?
    private let descrpitionView = UIView()
    private let infoView = UIView()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.lineBreakMode = .byClipping
        label.text = "당근마켓은 우리 동네 주민들만을 위한 중고 직거래 앱입니다.\n항상 어렵기만 했던 중고거래, 당근마켓에서 지금까지와는 다른 새로운 중고거래를 경험하세요!\n\n지역 중고거래 1등, 당근마켓은 이런 것이 달라요!\n● 번거로운 포장, 택배 없이 내 집 앞에서 직거래\n중고거래에서 가장 귀찮은 건 포장과 택배! 우리 동네 마켓이라 동네 주민들과 직거래할 수 있어요.\n\n● 동네 인증 시스템으로 주민들과 안전하게 거래\n사기당할 걱정 없이 동네 인증 한 주민들 간의 거래로 믿을 수 있어요.\n\n● 매너 시스템으로 사용자의 실제 거래 매너를 확인\n매너 평가, 거래 후기를 바탕으로 형성된 매너 온도를 통해 거래 상대방의 실제 매너를 확인할 수 있어요.\n\n● 1:1채팅으로 쉽고 빠르게 거래 성사\n편리한 앱 내 채팅으로 소통하기 때문에 빠르게 거래가 성사될 수 있어요.\n\n● 우리 동네 정보를 한눈에\n동네 주민들이 추천하는 동네 업체 정보를 모아 볼 수 있어요.\n\n당근마켓에서는 \n\n패션(여성의류, 남성의류), 화장품(기초, 색조, 메이크업), 컴퓨터(노트북, PC, 아이패드 등), 스마트폰(아이폰, 갤럭시 등), 가전제품(에어컨, 냉장고, TV 등), 가구 및 인테리어 소품(소파, 침대, 의자, 장롱 등), 액세서리, 유아용품(유모차, 카시트, 아기용품), 도서, 티켓, 용달 정보 등등 다양한 중고 물건들이 거래되고 있어요.\n내 동네 주민들이 직접 기른 농산물도 인기 물품이랍니다. 버리지 말고 재활용하고 나누어 공유경제를 실천해보세요.\n매일매일 내 근처에서 열리는 벼룩시장을 만날 수 있어요.\n\n지금 바로 우리 동네 다양한 매물을 구경해보세요:) \n당근마켓은 근처 주민 간의 따뜻하고 건강한 중고거래를 지향합니다. \n\n문의사항이나 제안하시고 싶은 점이 있으시면 주저하지 마시고 글을 남겨주세요!\n열심히 듣기 위해 항상 노력하고 있답니다 :)\n\n[https://www.daangn.com/web/feedbacks/new?type=UserVoiceFeedback](https://www.daangn.com/web/feedbacks/new?type=UserVoiceFeedback)\n\n=당근마켓 서비스 접근권한 안내\n당근마켓에서는 사용성의 편의를 위해 최소한의 디바이스 권한을 사용하고 있어요. 다음은 당근마켓에서 왜 이러한 디바이스 관련 권한이 필요한지 설명해드릴게요.\n\n=[필수] 위치 획득 권한\n당근마켓은 지역 기반 중고거래 서비스라 현재 위치 인증을 통해 내 동네인지 인증을 하고 있어요. 또한 현위치에서 내 동네를 찾기 위해서도 위치 획득 권한이 필수로 필요해요 :)\n\n=[선택] 푸시 알림 권한\n당근마켓은 서비스 이용중 채팅이나 공지내용을 알리기 위해 푸시 알림 권한을 사용하고 있어요.\n동의하지 않는 경우에는 알림이 울리지 않아요.\n\n=[선택] 카메라/사진 권한 - 휴대폰 스토리지 접근 권한\n당근마켓에서는 사용자가 글쓰기를 할 때 사진을 올리면 data 전송 비용을 아끼기 위해 해당 사진을 스토리지에 저장 후 최적화된 사이즈로 캐시 영역에 다시 저장한 뒤 서버로 전송하게 됩니다.\n그래서 읽기 쓰기 권한을 사용하고 있어요.\n동의하지 않는 경우에는 사진을 게시할 수 없어요.\n\n[당근마켓이 궁금해요!] \n\n당근마켓은 '당신의 근처에서 만나는 마켓’이란 뜻으로, 동네에서 주민들과 중고 물품을 직거래하는 서비스입니다. 동네 인증, 매너 평가, 거래 후기 등 유저 신뢰도 평가에 주력하고 있으며, 다양한 지표들을 매너 온도로 표시하여 사용자들이 믿고 거래할 수 있도록 하였습니다. 당근마켓은 동네 직거래뿐 아니라 지역 소상공인 연결 서비스 등 다양한 지역기반 서비스를 제공하고 있습니다. 더 나아가 당근마켓은 동네에 대한 모든 정보와 사람을 연결하고자 합니다.\n\n-홈페이지 : https://www.daangn.com/\n-페이스북 (SNS) : https://www.facebook.com/daangn/ \n-인스타그램 (SNS) : https://www.instagram.com/daangnmarket/\n-네이버 블로그 : https://blog.naver.com/daangn\n-고객문의 메일 : cs@daangnservice.com"
        return label
    }()
    
    private lazy var moreBtn: UILabel = {
        let label = UILabel()
        let tap = UITapGestureRecognizer(target: self, action: #selector(moreBtnAction(_:)))
        label.text = "   더 보기 "
        label.textColor = .link
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .link
        label.text = "Danggeun Market Inc."
        return label
    }()
    
    private let developerLabel: UILabel = {
        let label = UILabel()
        label.text = "개발자"
        label.textColor = .gray
        return label
    }()
    
    private let chevronImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .gray
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
        gradation(moreBtn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }

}

extension DetailDescriptionCell{
    @objc private func moreBtnAction(_ sender: UITapGestureRecognizer) {
        guard let delegate = delegate else { return }
        descriptionLabel.numberOfLines = 0
        moreBtn.isHidden = true
        delegate.cellTapped()
        
    }
    
}


extension DetailDescriptionCell {
    private func setupUI() {
        [descrpitionView, infoView].forEach {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            descrpitionView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            descrpitionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            descrpitionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            
            infoView.topAnchor.constraint(equalTo: descrpitionView.bottomAnchor, constant: 20),
            infoView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            infoView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            infoView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20)
        ])
        
        [descriptionLabel, moreBtn].forEach {
            descrpitionView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: descrpitionView.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: descrpitionView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: descrpitionView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: descrpitionView.bottomAnchor),
            
            moreBtn.trailingAnchor.constraint(equalTo: descrpitionView.trailingAnchor),
            moreBtn.bottomAnchor.constraint(equalTo: descrpitionView.bottomAnchor),
        ])
        
        [artistNameLabel, developerLabel, chevronImage].forEach {
            infoView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            artistNameLabel.topAnchor.constraint(equalTo: infoView.topAnchor),
            artistNameLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor),
            artistNameLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor),
            
            developerLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 5),
            developerLabel.bottomAnchor.constraint(equalTo: infoView.bottomAnchor),
            developerLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor),
            developerLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor),
            
            chevronImage.centerYAnchor.constraint(equalTo: infoView.centerYAnchor),
            chevronImage.trailingAnchor.constraint(equalTo: infoView.trailingAnchor),
        ])
    }
}
