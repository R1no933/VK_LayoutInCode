//
//  ViewController.swift
//  iOS6_HW11_Dmitriy Baskakov
//
//  Created by Dmitriy Baskakov on 27.05.2022.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - StackView's
    lazy var mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        
        mainStackView.axis = .vertical
        mainStackView.spacing = 0
        mainStackView.distribution = .equalSpacing
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return mainStackView
    }()
    
    lazy var headerStackView = createHorizontalStackView(distribution: .fillProportionally, alignment: .top, spacing: 0)
    lazy var headerInfoStackView = createVerticalStackView(spacing: 0, alignment: .leading)
    lazy var iconsStackView = createHorizontalStackView(distribution: .equalCentering, alignment: .fill, spacing: 0)
    lazy var iconsLabelStackView = createHorizontalStackView(distribution: .equalCentering, alignment: .center, spacing: 0)
    lazy var infoStackView = createHorizontalStackView(distribution: .fillProportionally, alignment: .leading, spacing: 5)
    lazy var iconsInfoStackView = createVerticalStackView(spacing: 11, alignment: .leading)
    lazy var discriptionInfoStackView = createVerticalStackView(spacing: 6, alignment: .leading)
    
    //MARK: - Button's
    lazy var avatarButton: UIButton = {
        let avatarButton = UIButton()
        
        avatarButton.setImage(UIImage(named: "avatarImage"), for: .normal)
        avatarButton.layer.masksToBounds = true
        avatarButton.layer.cornerRadius = Metrics.avatarButtonSize / 2
        
        return avatarButton
    }()
    
    lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        
        setStatusButton.setTitle(Strings.setstatusLabel, for: .normal)
        setStatusButton.backgroundColor = .black
        setStatusButton.setTitleColor(UIColor.systemBlue, for: .normal)
        
        return setStatusButton
    }()
    
    lazy var editButton: UIButton = {
        let editButton = UIButton()
        
        editButton.setTitle(Strings.editButtonTitle, for: .normal)
        editButton.backgroundColor = .darkGray
        editButton.layer.cornerRadius = 10
        editButton.layer.masksToBounds = true
        
        return editButton
    }()
    
    //MARK: - Label's
    
    //headerInfoStackView
    lazy var nameLabel = createLabel(text: Strings.nameLabel, fontSize: Metrics.nameLabelFontSize, color: Metrics.nameLabelFontColor)
    lazy var onlineStatusLabel = createLabel(text: Strings.onlineStatusLabel, fontSize: Metrics.onlineStatusLabelFontSize, color: Metrics.onlineStatusLabelFontColor)
    
    //iconsStackView
    lazy var storiesLabel = createLabel(text: Strings.storiesLabel, fontSize: 18, color: Metrics.iconsColor)
    lazy var postLabel = createLabel(text: Strings.postLabel, fontSize: 18, color: Metrics.iconsColor)
    lazy var fotoLabel = createLabel(text: Strings.fotoLabel, fontSize: 18, color: Metrics.iconsColor)
    lazy var videoLabel = createLabel(text: Strings.videoLabel, fontSize: 18, color: Metrics.iconsColor)
    
    //infoStackView
    lazy var homeLabel = createLabel(text: Strings.citiLabel, fontSize: 20, color: .darkGray)
    lazy var subscribeLabel = createLabel(text: Strings.subscribeLabel, fontSize: 20, color: .darkGray)
    lazy var workLabel = createLabel(text: Strings.workLabel, fontSize: 20, color: .systemBlue)
    lazy var giftLabel = createLabel(text: Strings.giftLabel, fontSize: 20, color: .systemPurple)
    lazy var informationLabel = createLabel(text: Strings.informLabel, fontSize: 20, color: .white)
    
    //MARK: - ImageView's
    
    //iconsStackView
    lazy var photoIcon = createImageView("camera", color: Metrics.iconsColor)
    lazy var noteIcon = createImageView("square.and.pencil", color: Metrics.iconsColor)
    lazy var galleryIcon = createImageView("photo", color: Metrics.iconsColor)
    lazy var clipsIcon = createImageView("video.square", color: Metrics.iconsColor)
    
    //Line
    lazy var line = createIconsView("minus", color: .lightGray)
    
    //infoStackView
    lazy var homeIcon = createIconsView("house", color: .darkGray)
    lazy var subscribeIcon = createIconsView("dot.radiowaves.up.forward", color: .darkGray)
    lazy var workIcon = createIconsView("briefcase", color: .systemBlue)
    lazy var snowflaleIcon = createIconsView("snowflake", color: .systemPurple)
    lazy var informationIcon = createIconsView("info.circle.fill", color: .white)
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
        setupView()
        setupConstrains()
    }
    
    //MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(headerStackView)
        mainStackView.addArrangedSubview(editButton)
        mainStackView.addArrangedSubview(iconsStackView)
        mainStackView.addArrangedSubview(iconsLabelStackView)
        mainStackView.addArrangedSubview(line)
        mainStackView.addArrangedSubview(infoStackView)
        
        headerStackView.addArrangedSubview(avatarButton)
        headerStackView.addArrangedSubview(headerInfoStackView)
        
        headerInfoStackView.addArrangedSubview(nameLabel)
        headerInfoStackView.addArrangedSubview(setStatusButton)
        headerInfoStackView.addArrangedSubview(onlineStatusLabel)
        
        iconsStackView.addArrangedSubview(photoIcon)
        iconsStackView.addArrangedSubview(noteIcon)
        iconsStackView.addArrangedSubview(galleryIcon)
        iconsStackView.addArrangedSubview(clipsIcon)
        
        iconsLabelStackView.addArrangedSubview(storiesLabel)
        iconsLabelStackView.addArrangedSubview(postLabel)
        iconsLabelStackView.addArrangedSubview(fotoLabel)
        iconsLabelStackView.addArrangedSubview(videoLabel)
        
        infoStackView.addArrangedSubview(iconsInfoStackView)
        infoStackView.addArrangedSubview(discriptionInfoStackView)
        
        iconsInfoStackView.addArrangedSubview(homeIcon)
        iconsInfoStackView.addArrangedSubview(subscribeIcon)
        iconsInfoStackView.addArrangedSubview(workIcon)
        iconsInfoStackView.addArrangedSubview(snowflaleIcon)
        iconsInfoStackView.addArrangedSubview(informationIcon)
        
        discriptionInfoStackView.addArrangedSubview(homeLabel)
        discriptionInfoStackView.addArrangedSubview(subscribeLabel)
        discriptionInfoStackView.addArrangedSubview(workLabel)
        discriptionInfoStackView.addArrangedSubview(giftLabel)
        discriptionInfoStackView.addArrangedSubview(informationLabel)
        
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupConstrains() {
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        headerStackView.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 10).isActive = true
        headerStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 0).isActive = true
        headerStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: 0).isActive = true
        headerStackView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        avatarButton.topAnchor.constraint(equalTo: headerStackView.topAnchor, constant: 0).isActive = true
        avatarButton.leadingAnchor.constraint(equalTo: headerStackView.leadingAnchor, constant: 0).isActive = true
        avatarButton.trailingAnchor.constraint(equalTo: headerStackView.leadingAnchor, constant: 120).isActive = true
        avatarButton.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        headerInfoStackView.topAnchor.constraint(equalTo: headerStackView.topAnchor, constant: 20).isActive = true
        headerInfoStackView.leadingAnchor.constraint(equalTo: avatarButton.leadingAnchor, constant: 150).isActive = true
        headerInfoStackView.trailingAnchor.constraint(equalTo: headerStackView.trailingAnchor, constant: 0).isActive = true
        headerInfoStackView.bottomAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: -20).isActive = true
        
        editButton.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 30).isActive = true
        editButton.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 0).isActive = true
        editButton.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: 0).isActive = true
        editButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        iconsStackView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 30).isActive = true
        iconsStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 25).isActive = true
        iconsStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -20).isActive = true
        iconsStackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        iconsLabelStackView.topAnchor.constraint(equalTo: iconsLabelStackView.bottomAnchor, constant: 10).isActive = true
        iconsLabelStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 4).isActive = true
        iconsLabelStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -5).isActive = true
        iconsLabelStackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        line.topAnchor.constraint(equalTo: iconsLabelStackView.bottomAnchor, constant: 30).isActive = true
        line.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 0).isActive = true
        line.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: 0).isActive = true
        
        infoStackView.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 20).isActive = true
        
        
    }
    
    //MARK: - Functions
    
    //Функция создания горизонтального стеквью
    private func createHorizontalStackView(distribution: UIStackView.Distribution, alignment: UIStackView.Alignment, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = distribution
        stackView.alignment = alignment
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = spacing
        
        return stackView
    }
    
    //Функция создания вертикального стеквью
    private func createVerticalStackView(spacing: CGFloat, alignment: UIStackView.Alignment) -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = alignment
        stackView.spacing = spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
    
    //Функция создания ImageView под иконки
    private func createImageView(_ name: String, color: UIColor) -> UIImageView {
        let iconImageView = UIImageView()
        let iconImage = UIImage(systemName: name)?.withTintColor(color, renderingMode: .alwaysOriginal)
        
        iconImageView.image = iconImage
        iconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        return iconImageView
    }
    
    private func createIconsView(_ name: String, color: UIColor) -> UIImageView {
        let iconsImageView = UIImageView()
        let iconsInfoImage = UIImage(systemName: name)?.withTintColor(color, renderingMode: .alwaysOriginal)
        
        iconsImageView.image = iconsInfoImage
        iconsImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        iconsImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        return iconsImageView
    }
    
    //Функция создания лейблов
    private func createLabel(text: String, fontSize: CGFloat, color: UIColor) -> UILabel {
        let label = UILabel()
        
        label.text = text
        label.font = .systemFont(ofSize: fontSize)
        label.textColor = color
        
        return label
    }
}

// MARK: - Extension's
extension ViewController {
    enum Metrics {
        //Параметры имени в headerInfoStackView
        static let nameLabelFontSize: CGFloat = 30
        static let nameLabelFontColor: UIColor = .white
        
        //Параметры onlineStatusLabel
        static let onlineStatusLabelFontSize: CGFloat = 18
        static let onlineStatusLabelFontColor: UIColor = .lightGray
        
        //Параметры кнопки аватарки
        static let avatarButtonSize: CGFloat = 120
        
        // !!!
        static let iconsColor: UIColor = .systemBlue
    }
    
    enum Strings {
        static let nameLabel: String = "Иванов Иван"
        static let setstatusLabel: String = "Установите статус"
        static let onlineStatusLabel: String = "online \u{2360}"
        static let editButtonTitle: String = "Редактировать"
        static let storiesLabel: String = "История"
        static let postLabel: String = "Запись"
        static let fotoLabel: String = "Фото"
        static let videoLabel: String = "Клипы"
        static let citiLabel: String = "Город: Москва"
        static let subscribeLabel: String = "35 подписчиков"
        static let workLabel: String = "Указать место работы"
        static let giftLabel: String = "Получить подарок \u{1433}"
        static let informLabel: String = "Подробная информация"
    }
}
