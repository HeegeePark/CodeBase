//
//  SearchViewController.swift
//  Netflix_Codebase
//
//  Created by 박희지 on 1/29/24.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    let searchBar = UIButton()
    
    let comingSoonButton = UIButton()
    let popularContentsButton = UIButton()
    let top10SeriesButton = UIButton()
    
    let resultLabel = UILabel()
    let descriptionLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureView()
        setupConstraints()
    }
    
    @objc func comingSoonButtonTapped(_ sender: Any) {
        updateButton(comingSoonButton, active: true)
        updateButton(popularContentsButton, active: false)
        updateButton(top10SeriesButton, active: false)
        
        updateLabels(result: "어머! 공개 예정된 작품이 없습니다.", description: "곧 좋은 소식 가져올테니 기다려 주세요🙏")
    }
    
    @objc func popularContentsButtonTapped(_ sender: Any) {
        updateButton(comingSoonButton, active: false)
        updateButton(popularContentsButton, active: true)
        updateButton(top10SeriesButton, active: false)
        
        updateLabels(result: "웁스! 모두의 인기 콘텐츠 작품이 없습니다.", description: "인기란 얻기 어려운 법이죠✨")
    }
    
    @objc func top10SeriesButtonTapped(_ sender: Any) {
        updateButton(comingSoonButton, active: false)
        updateButton(popularContentsButton, active: false)
        updateButton(top10SeriesButton, active: true)
        
        updateLabels(result: "맙소사! TOP 10 작품이 없습니다.", description: "왜 없는지는 같이 생각해봐요😇")
    }
}

// MARK: - Custom UI
extension SearchViewController: UIViewControllerByCode {
    func configureNavigationBar() {
        navigationItem.title = "NEW & HOT 검색"
    }
    
    func configureView() {
        view.addSubViews(searchBar, comingSoonButton, popularContentsButton, top10SeriesButton, resultLabel, descriptionLabel)
        
        view.backgroundColor = .black
        
        var searchConfig = UIButton.Configuration.filled()
        searchConfig.baseBackgroundColor = #colorLiteral(red: 0.195477128, green: 0.195477128, blue: 0.195477128, alpha: 1)
        searchConfig.baseForegroundColor = .lightGray
        searchConfig.image = UIImage(systemName: "magnifyingglass")
        searchConfig.imagePadding = 4
        searchConfig.contentInsets = .init(top: 8, leading: -100, bottom: 8, trailing: 0)
        var placeholder = AttributedString.init("게임, 시리즈, 영화를 검색하세요...")
        placeholder.font = .systemFont(ofSize: 15)
        searchConfig.attributedTitle = placeholder
        searchBar.configuration = searchConfig
        
        designButton(comingSoonButton, title: "공개 예정", image: UIImage(named: "blue")!)
        comingSoonButton.addTarget(self, action: #selector(comingSoonButtonTapped), for: .touchUpInside)
        updateButton(comingSoonButton, active: true)
                     
        designButton(popularContentsButton, title: "모두의 인기 콘텐츠", image: UIImage(named: "turquoise")!)
        
        popularContentsButton.addTarget(self, action: #selector(popularContentsButtonTapped), for: .touchUpInside)
        
        designButton(top10SeriesButton, title: "TOP 10 시리즈", image: UIImage(named: "pink")!)
        top10SeriesButton.addTarget(self, action: #selector(top10SeriesButtonTapped), for: .touchUpInside)
        
        let result = "이런! 찾으시는 작품이 없습니다."
        let description = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
        updateLabels(result: result, description: description)
        
        resultLabel.font = .boldSystemFont(ofSize: 23)
        resultLabel.textColor = .white
        resultLabel.textAlignment = .center
        
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .center
    }
    
    func setupConstraints() {
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        comingSoonButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.top.equalTo(searchBar.snp.bottom).offset(8)
            make.width.equalTo(96)
            make.height.equalTo(28)
        }
        
        popularContentsButton.snp.makeConstraints { make in
            make.leading.equalTo(comingSoonButton.snp.trailing).offset(8)
            make.top.equalTo(comingSoonButton)
            make.width.equalTo(140)
            make.height.equalTo(28)
        }
        
        top10SeriesButton.snp.makeConstraints { make in
            make.leading.equalTo(popularContentsButton.snp.trailing).offset(8)
            make.top.equalTo(comingSoonButton)
            make.width.equalTo(130)
            make.height.equalTo(28)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(resultLabel.snp.bottom).offset(12)
        }
    }
    
    // 디자인 버튼
    func designButton(_ button: UIButton, title: String, image: UIImage) {
        button.setTitle(title, for: .normal)
        button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 12)
        button.setTitleColor(.lightGray, for: .normal)
        button.setTitleColor(.black, for: .selected)
        button.titleLabel?.sizeToFit()
        button.titleEdgeInsets = .init(top: 4, left: 10, bottom: 4, right: 10)
        button.layer.cornerRadius = 14
    }
    
    // 버튼 선택 여부 업데이트
    func updateButton(_ button: UIButton, active: Bool) {
        button.isSelected = active
        button.backgroundColor = active ? .white: .black
    }
    
    // 레이블 문구 업데이트
    func updateLabels(result: String, description: String) {
        resultLabel.text = result
        descriptionLabel.text = description
    }
}
