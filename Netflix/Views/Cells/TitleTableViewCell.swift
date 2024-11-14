//
//  UpcomingTableViewCell.swift
//  Netflix
//
//  Created by user on 12/03/24.
//

import UIKit


class TitleTableViewCell: UITableViewCell {
    
    static let identifier = "UpcomingTableViewCell"
    
    private let imageOfView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playButton: UIButton = {
        let btn = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        btn.setImage(image, for: .normal)
        btn.tintColor = .label
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(imageOfView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(playButton)
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else { return }
        imageOfView.sd_setImage(with: url)
        nameLabel.text = model.titleName
    }
    
    private func setConstrains() {
        NSLayoutConstraint.activate([
            imageOfView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageOfView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageOfView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            imageOfView.widthAnchor.constraint(equalToConstant: 100),
            
            nameLabel.centerYAnchor.constraint(equalTo: imageOfView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: imageOfView.trailingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: -10),
            
            playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}
