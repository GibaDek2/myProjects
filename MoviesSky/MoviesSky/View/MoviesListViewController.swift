//
//  ViewController.swift
//  MoviesSky
//
//  Created by Gilberto Amaro on 01/08/22.
//

import UIKit
import SnapKit

class MoviesListViewController: UIViewController {
    let controller = MoviesListController()
    
    var myTableViewMovies: UITableView = {
        let myTableViewMovies = UITableView(frame: .zero)
        myTableViewMovies.register(CustomCellTableViewCell.self, forCellReuseIdentifier: CustomCellTableViewCell.identifier)
        return myTableViewMovies
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = controller.title
        addElementView()
        configElemenstConstraints()
        setupTableView()
        myRequest()
    }
    
    func addElementView() {
        view.addSubview(myTableViewMovies)
    }
    
    func configElemenstConstraints() {
        myTableViewMovies.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leftMargin.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    func setupTableView() {
        self.myTableViewMovies.delegate = self
        self.myTableViewMovies.dataSource = self
    }
    
    func reloadRequestData() {
        self.myTableViewMovies.reloadData()
    }
    
    func showAlertError() {
        let alert = UIAlertController(title: controller.showAlertError, message: controller.showMessageError, preferredStyle: .alert)
        let button = UIAlertAction(title: controller.showOkButton, style: .destructive, handler: nil)
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
    }
    
    func myRequest() {
        controller.requestMoviesController { [weak self] success in
            if success {
                self?.reloadRequestData()
            } else {
                self?.showAlertError()
            }
        }
    }
}

extension MoviesListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.numberOfRowsInTableView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellTableViewCell.identifier, for: indexPath) as? CustomCellTableViewCell{
            cell.setupCell(content: controller.getContentByIndex(indexPath: indexPath))
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return controller.heightForRowAt
    }
}

