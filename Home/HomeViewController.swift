//
//  HomeViewController.swift
//  StudyAPP
//
//  Created by Diego Rodrigues on 02/06/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeScreen?
    var list: [HomeModel] = []
    
    //explica
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
      self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBackground()
        screen?.configTableView(delegate: self, datasource: self)
        screen?.delegate(delegate: self)
        
    }
    
    private func configBackground() {
    view.backgroundColor = .red
   
    }

    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.endIndex
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = screen?.tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identefier, for: indexPath) as?
        ProfileTableViewCell else{
         return UITableViewCell()
       }
        cell.setupCell(model: list[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}

extension HomeViewController: HomeScreenProtocol {
    func tappedAddButton(text: String) {
        if let name = screen?.textField.text, !name.isEmpty {
            list.append(HomeModel(image: screen?.profileImageView.image ?? UIImage(), name: screen?.textField.text  ?? ""))
            screen?.textField.text = ""
            screen?.profileImageView.image = UIImage(systemName: "person.circle.fill")
            screen?.tableView.reloadData()
            screen?.tableView.scrollToRow(at: IndexPath(row: list.count - 1, section: 0), at: .bottom, animated: true)
        }else{
            let alertController = UIAlertController(title: "Ops", message: "Informe o nome", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(okButton)
            present(alertController, animated: true)
        }
    }
    
    
    
    
}

