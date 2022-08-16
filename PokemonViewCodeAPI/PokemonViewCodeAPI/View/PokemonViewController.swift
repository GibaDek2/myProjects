//
//  ViewController.swift
//  PokemonViewCodeAPI
//
//  Created by Gilberto Amaro on 16/08/22.
//

import UIKit
import SnapKit

class PokemonViewController: UIViewController {
    let controller = PokemonListController()
    
    var myPokemonTableView: UITableView = {
        let myPokemonTableView = UITableView(frame: .zero)
        myPokemonTableView.register(CustomTableViewCellPokemon.self, forCellReuseIdentifier: CustomTableViewCellPokemon.myIdentifierCell)
        return myPokemonTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = controller.titleOnTop
        addElementView()
        addElementConstraints()
        setupTableView()
        myRequest()
    }
    
    func addElementView() {
        view.addSubview(myPokemonTableView)
    }
    
    func addElementConstraints() {
        myPokemonTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leftMargin.equalTo(0)
            make.rightMargin.equalTo(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    func setupTableView() {
        self.myPokemonTableView.delegate = self
        self.myPokemonTableView.dataSource = self
    }
    
    func reloadDataRequest() {
        self.myPokemonTableView.reloadData()
    }
    
    func showAlertError() {
        let alert = UIAlertController(title: controller.showAlert, message: controller.showMessage, preferredStyle: .alert)
        let button = UIAlertAction(title: controller.showButton, style: .destructive, handler: nil)
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
    }
    
    func myRequest() {
        controller.requestListController { [weak self] success in
            if success {
                self?.reloadDataRequest()
            } else {
                self?.showAlertError()
            }
        }
    }
}

extension PokemonViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.numberOfRowsInTableView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCellPokemon.myIdentifierCell, for: indexPath) as? CustomTableViewCellPokemon {
            cell.setupCell(result: controller.getResultByIndexPath(indexPath: indexPath))
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return controller.heightForRowAt
    }
}

