//
//  ViewController.swift
//  YugiCards
//
//  Created by Gilberto Amaro on 27/07/22.
//

import UIKit
import SnapKit

class ListCardsViewController: UIViewController {
    
    let controller = ControllerYugioh()
    
    var myTableViewCards: UITableView = {
        let myTableViewCards = UITableView(frame: .zero)
        myTableViewCards.register(CustomCellYugiCardsListTableViewCell.self, forCellReuseIdentifier: CustomCellYugiCardsListTableViewCell.identifier)
        return myTableViewCards
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addElementsViews()
        configElementsConstraints()
        setupTableView()
        myRequest()
    }
    
    func addElementsViews() {
        view.addSubview(myTableViewCards)
    }
    
    func setupTableView() {
        self.myTableViewCards.delegate = self
        self.myTableViewCards.dataSource = self
    }
    
    func configElementsConstraints() {
        myTableViewCards.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leftMargin.equalTo(0)
            make.rightMargin.equalTo(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    func requestReloadData() {
        self.myTableViewCards.reloadData()
    }
    
    func showErrorAlertMessage() {
        let alert = UIAlertController(title: controller.showAlert, message: controller.showAlertMessageError, preferredStyle: .alert)
        let button = UIAlertAction(title: controller.buttonOk, style: .destructive, handler: nil)
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
    }
    
    func myRequest() {
        controller.requestController { [weak self] success in
            if success {
                self?.requestReloadData()
            } else {
                self?.showErrorAlertMessage()
            }
        }
    }
}

extension ListCardsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellYugiCardsListTableViewCell.identifier, for: indexPath) as? CustomCellYugiCardsListTableViewCell {
            cell.setupCell(datum: controller.getCardByIndex(indexPath: indexPath))
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        controller.heightForRowAt
    }
    
    
}

