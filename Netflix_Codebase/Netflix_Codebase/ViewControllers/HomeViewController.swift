//
//  HomeViewController.swift
//  Netflix_Codebase
//
//  Created by 박희지 on 1/29/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    let backgroundView = UIImageView()
    let mainPosterImageView = UIImageView()
    let descriptionLabel = UILabel()
    let wishButton = UIButton()
    
    let hotLabel = UILabel()
    let hot1PosterImageView = UIImageView()
    let hot1logoImageView = UIImageView()
    let hot1Top10ImageView = UIImageView()
    let hot1NewEpisodeView = UIButton()
    
    let hot2PosterImageView = UIImageView()
    let hot2logoImageView = UIImageView()
    let hot2Top10ImageView = UIImageView()
    let hot2NewEpisodeView = UIButton()
    
    let hot3PosterImageView = UIImageView()
    let hot3logoImageView = UIImageView()
    let hot3Top10ImageView = UIImageView()
    let hot3NewEpisodeView = UIButton()
    
    let playButton = UIButton()
    
    let posterList: [String] = ["노량", "더퍼스트슬램덩크", "밀수", "범죄도시3", "서울의봄", "스즈메의문단속", "아바타물의길", "오펜하이머", "육사오", "콘크리트유토피아"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureView()
        setupConstraints()
    }
    
    // 재생 버튼을 누르면 포스터 랜덤 셔플
    @objc func playButtonTapped(_ sender: UIButton) {
        randomPosterImageView(mainPosterImageView)
        randomPosterImageView(hot1PosterImageView, logo: hot1logoImageView, top10: hot1Top10ImageView, newEp: hot1NewEpisodeView)
        randomPosterImageView(hot2PosterImageView, logo: hot2logoImageView, top10: hot2Top10ImageView, newEp: hot2NewEpisodeView)
        randomPosterImageView(hot3PosterImageView, logo: hot3logoImageView, top10: hot3Top10ImageView, newEp: hot3NewEpisodeView)
    }
    
}

// MARK: - Custom UI
extension HomeViewController: UIViewControllerByCode {
    func configureNavigationBar() {
        navigationItem.title = "고래밥님"
    }
    
    func configureView() {
        view.addSubViews(backgroundView, mainPosterImageView, hot1PosterImageView, hot2PosterImageView, hot3PosterImageView, hotLabel)
        
        mainPosterImageView.addSubViews(descriptionLabel, playButton, wishButton)
        
        hot1PosterImageView.addSubViews(hot1logoImageView, hot1Top10ImageView, hot1NewEpisodeView)
        hot2PosterImageView.addSubViews(hot2logoImageView, hot2Top10ImageView, hot2NewEpisodeView)
        hot3PosterImageView.addSubViews(hot3logoImageView, hot3Top10ImageView, hot3NewEpisodeView)
        
        view.backgroundColor = .black
        
        // backgruound Image
        backgroundView.image = .background
        backgroundView.contentMode = .scaleAspectFill
        
        // 메인포스터 이미지뷰
        randomPosterImageView(mainPosterImageView)
        mainPosterImageView.contentMode = .scaleAspectFill
        designPosterImageView(mainPosterImageView, borderColor: UIColor.blue.cgColor)
        
        // 영화 설명 레이블
        descriptionLabel.text = "응원하고픈 • 흥미진진 • 사극 • 전투 • 한국 작품"
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.textColor = .white
        
        // 재생 버튼
        var playButtonConfig = UIButton.Configuration.filled()
        playButtonConfig.image = .play
        playButtonConfig.imagePadding = 4
        playButtonConfig.baseBackgroundColor = .white
        playButtonConfig.baseForegroundColor = .black
        var titleAttr = AttributedString.init("재생")
        titleAttr.font = .systemFont(ofSize: 13)
        playButtonConfig.attributedTitle = titleAttr
        playButton.configuration = playButtonConfig
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        
        // 내가 찜한 리스트 버튼
        var wishButtonConfig = UIButton.Configuration.filled()
        wishButtonConfig.image = UIImage(systemName: "plus")
        wishButtonConfig.imagePadding = 4
        wishButtonConfig.baseBackgroundColor = .gray.withAlphaComponent(0.7)
        wishButtonConfig.baseForegroundColor = .white
        var titleAttr1 = AttributedString.init("내가 찜한 리스트")
        titleAttr1.font = .systemFont(ofSize: 13)
        wishButtonConfig.attributedTitle = titleAttr1
        wishButton.configuration = wishButtonConfig
        
        // 지금 뜨는 콘텐츠
        hotLabel.text = "지금 뜨는 콘텐츠"
        hotLabel.font = .systemFont(ofSize: 15)
        hotLabel.textColor = .white
        
        // hot 포스터 이미지들
        let posters = posterList.shuffled()[0..<3]
        
        for (i, posterImageView) in [hot1PosterImageView, hot2PosterImageView, hot3PosterImageView].enumerated() {
            posterImageView.image = UIImage(named: posters[i])
            posterImageView.contentMode = .scaleAspectFill
            designPosterImageView(posterImageView, borderColor: UIColor.red.cgColor)
        }
        randomPosterImageView(hot1PosterImageView, logo: hot1logoImageView, top10: hot1Top10ImageView, newEp: hot1NewEpisodeView)
        randomPosterImageView(hot2PosterImageView, logo: hot2logoImageView, top10: hot2Top10ImageView, newEp: hot2NewEpisodeView)
        randomPosterImageView(hot3PosterImageView, logo: hot3logoImageView, top10: hot3Top10ImageView, newEp: hot3NewEpisodeView)
    }
    
    func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainPosterImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalToSuperview().multipliedBy(0.55)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(playButton.snp.top).offset(-10)
        }
        
        playButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(20)
            make.width.equalTo(mainPosterImageView).multipliedBy(0.45)
        }
        
        wishButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(20)
            make.size.equalTo(playButton)
        }
        
        hotLabel.snp.makeConstraints { make in
            make.leading.equalTo(mainPosterImageView.snp.leading)
            make.top.equalTo(mainPosterImageView.snp.bottom).offset(6)
        }
        
        hot1PosterImageView.snp.makeConstraints { make in
            make.trailing.equalTo(hot2PosterImageView.snp.leading).offset(-4)
            make.top.equalTo(hot2PosterImageView.snp.top)
            make.width.equalTo(view.snp.width).multipliedBy(0.3)
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        configureHotPoster(hot1PosterImageView, logo: hot1logoImageView, top10: hot1Top10ImageView, newEp: hot1NewEpisodeView)
        
        hot2PosterImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(hotLabel.snp.bottom).offset(6)
            
            make.width.equalTo(view.snp.width).multipliedBy(0.3)
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        configureHotPoster(hot2PosterImageView, logo: hot2logoImageView, top10: hot2Top10ImageView, newEp: hot2NewEpisodeView)
        
        hot3PosterImageView.snp.makeConstraints { make in
            make.leading.equalTo(hot2PosterImageView.snp.trailing).offset(4)
            make.top.equalTo(hot2PosterImageView.snp.top)
            make.width.equalTo(view.snp.width).multipliedBy(0.3)
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        configureHotPoster(hot3PosterImageView, logo: hot3logoImageView, top10: hot3Top10ImageView, newEp: hot3NewEpisodeView)
    }
    
    // 포스터 이미지뷰 테두리 디자인
    func designPosterImageView(_ imageView: UIImageView, borderColor: CGColor) {
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = borderColor
    }
    
    // 포스터 이미지 랜덤 지정
    func randomPosterImageView(_ imageView: UIImageView, logo logoImageView: UIImageView? = nil, top10 top10ImageView: UIImageView? = nil, newEp newEpisodeImageView: UIButton? = nil) {
        let poster = posterList.randomElement()!
        imageView.image = UIImage(named: poster)
        
        logoImageView?.isHidden = Bool.random()
        top10ImageView?.isHidden = Bool.random()
        newEpisodeImageView?.isHidden = Bool.random()
    }
    
    // 지금 뜨는 콘텐츠 안 UI
    func configureHotPoster(_ imageView: UIImageView, logo logoImageView: UIImageView, top10 top10ImageView: UIImageView, newEp newEpisodeImageView: UIButton) {
        
        logoImageView.image = .singleSmall
        logoImageView.contentMode = .scaleAspectFit
        
        top10ImageView.image = .top10Badge
        top10ImageView.contentMode = .scaleAspectFit
        
        var newEPConfig = UIButton.Configuration.filled()
        newEPConfig.baseBackgroundColor = .red
        newEPConfig.baseForegroundColor = .white
        newEPConfig.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)
        newEPConfig.cornerStyle = .small
        var titleAttr = AttributedString.init("새로운 에피소드")
        titleAttr.font = .systemFont(ofSize: 10)
        newEPConfig.attributedTitle = titleAttr
        newEpisodeImageView.configuration = newEPConfig
        
        logoImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(8)
        }
        
        top10ImageView.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(2)
        }
        
        newEpisodeImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
