//
//  ProfileTableViewCell.swift
//  StudyApp
//
//  Created by Diego Rodrigues on 05/06/23.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    static let identefier: String = String(describing: ProfileTableViewCell.self)
    
    lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = UIColor.black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        AddElements()
        configConstraints()
    }
    
    private func AddElements() {
        addSubview(profileImageView)
        addSubview(nameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
        
    }
        
        public func setupCell(model: HomeModel) {
            nameLabel.text = model.name
            profileImageView.image = model.image
        }
    
}
