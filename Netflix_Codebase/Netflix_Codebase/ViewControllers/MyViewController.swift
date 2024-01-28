//
//  MyViewController.swift
//  Netflix_Codebase
//
//  Created by 박희지 on 1/29/24.
//

import UIKit
import SnapKit

class MyViewController: UIViewController {
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let thumbnailImageView = UIImageView()
    let settingButton = UIButton()
    let goThroughButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureView()
        setupConstraints()
    }
}

// MARK: - Custom UI
extension MyViewController: UIViewControllerByCode {
    func configureNavigationBar() {
        navigationItem.title = "저장한 콘텐츠 목록"
    }
    
    func configureView() {
        view.addSubViews(titleLabel, descriptionLabel, thumbnailImageView, settingButton, goThroughButton)
        
        view.backgroundColor = .black
        
        // 제목
        designLabel(titleLabel, text: "'나만의 자동 저장' 기능", font: .boldSystemFont(ofSize: 20))
        
        // 부제
        let descriptionText = """
                        취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다.
                        디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요.
                        """
        designLabel(descriptionLabel, text: descriptionText, font: .systemFont(ofSize: 13))
        
        thumbnailImageView.image = .dummy
        thumbnailImageView.contentMode = .scaleAspectFit
        
        // 설정하기 버튼
        designButton(settingButton, title: "설정하기", titleColor: .white, backGroundColor: UIColor(red: 81 / 255, green: 104 / 255, blue: 221 / 255, alpha: 1))
        
        // 저장 가능한 콘텐츠 살펴보기 버튼
        designButton(goThroughButton, title: "저장 가능한 콘텐츠 살펴보기", titleColor: .black, backGroundColor: .white)
    }
    
    func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(descriptionLabel.snp.top).offset(-16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(thumbnailImageView.snp.top).offset(-16)
            make.width.equalTo(320)
        }
        
        thumbnailImageView.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
        }
        
        settingButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(thumbnailImageView.snp.bottom).offset(16)
            make.width.equalTo(250)
            make.height.equalTo(35)
        }
        
        goThroughButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(settingButton.snp.bottom).offset(16)
            make.width.equalTo(190)
            make.height.equalTo(35)
        }
    }
    
    // 레이블 디자인
    func designLabel(_ label: UILabel, text: String, font: UIFont) {
        label.text = text
        label.font = font
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
    }
    
    // 버튼 디자인
    func designButton(_ button: UIButton, title: String, titleColor: UIColor, backGroundColor: UIColor) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        button.backgroundColor = backGroundColor
        button.layer.cornerRadius = 3
    }
    
    
}
