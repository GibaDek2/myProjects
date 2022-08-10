//
//  ViewController.swift
//  MyYugiOhCards
//
//  Created by Gilberto Amaro on 10/08/22.
//

import UIKit
import SnapKit

class CardsListViewController: UIViewController {
    let controller = YugiListController()
    
    var myTableViewCards: UITableView = {
        let myTableViewCards = UITableView(frame: .zero)
        myTableViewCards.register(CustomCellCardsTableViewCell.self, forCellReuseIdentifier: CustomCellCardsTableViewCell.myIdentifier)
        return myTableViewCards
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = controller.titleTop
        addViewTableView()
        addTableViewConstraints()
        myRequest()
        setupTableView()
    }
    
    func addViewTableView() {
        view.addSubview(myTableViewCards)
    }
    
    func addTableViewConstraints() {
        myTableViewCards.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leftMargin.equalTo(0)
            make.rightMargin.equalTo(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    func setupTableView() {
        self.myTableViewCards.delegate = self
        self.myTableViewCards.dataSource = self
    }
    
    func reloadDataRequest() {
        self.myTableViewCards.reloadData()
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: controller.showAlert, message: controller.showAlertMessage, preferredStyle: .alert)
        let button = UIAlertAction(title: controller.showOkButton, style: .destructive, handler: nil)
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
    }
    
    func myRequest() {
        controller.requestController { [weak self] success in
            if success {
                self?.reloadDataRequest()
            } else {
                self?.showErrorAlert()
            }
        }
    }
}

extension CardsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.numberOfRowsInTableView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellCardsTableViewCell.myIdentifier, for: indexPath) as? CustomCellCardsTableViewCell {
            cell.setupCell(datum: controller.getDataByIndex(indexPath: indexPath))
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return controller.heightForRowAt
    }
    
}

