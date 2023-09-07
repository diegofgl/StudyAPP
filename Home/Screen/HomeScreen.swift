//
//  HomeScreen.swift
//  StudyApp
//
//  Created by Diego Rodrigues on 02/06/23.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func tappedAddButton(text: String)
}

class HomeScreen: UIView {
   
    weak var delegate: HomeScreenProtocol?
    
    func delegate(delegate: HomeScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.circle.fill")
        image.tintColor = UIColor.black
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        return image
    }()
    
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.white.cgColor
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        return button
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = UIColor.white
        label.text = "Name"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var clearButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        return button
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.placeholder = " Digite seu nome"
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 15
        return textField
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
        return button
    }()
    
    @objc public func tappedAddButton() {
        let text = textField.text ?? ""
        delegate?.tappedAddButton(text: text)
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identefier)
        return tableView
    }()
    
    public func configTableView(delegate: UITableViewDelegate, datasource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = datasource
    }
    
    //adicionar elemento
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    //organizar codigo
    private func addElements() {
        addSubview(profileImageView)
        addSubview(editButton)
        addSubview(nameLabel)
        addSubview(clearButton)
        addSubview(textField)
        addSubview(addButton)
        addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     //add constraints
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            profileImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            profileImageView.widthAnchor.constraint(equalToConstant: 150),
            profileImageView.heightAnchor.constraint(equalToConstant: 150),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            editButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            editButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            editButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            
            nameLabel.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalToConstant: 80),
            
            clearButton.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 10),
            clearButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            clearButton.widthAnchor.constraint(equalToConstant: 80),
            
            textField.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 50),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            textField.heightAnchor.constraint(equalToConstant: 40),

            addButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),

        ])
    }
}
