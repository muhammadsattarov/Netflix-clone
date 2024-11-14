//
//  HeroHeaderView.swift
//  Netflix
//
//  Created by user on 12/03/24.
//

import UIKit

class HeroHeaderView: UIView {
    
    private let playButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Play", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.cornerRadius = 4
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let downloadButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Download", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.cornerRadius = 4
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    private let imageOfView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private func addGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
// MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageOfView)
        addGradientLayer()
        addSubview(playButton)
        addSubview(downloadButton)
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageOfView.frame = bounds
    }
    
    func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else { return }
        imageOfView.sd_setImage(with: url)
    }
    
}

// MARK: - Set Constrains
extension HeroHeaderView {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 120),
            
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 120),
            
        ])
    }
}
