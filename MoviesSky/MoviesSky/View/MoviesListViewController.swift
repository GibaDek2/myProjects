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
        // Do any additional setup after loading the view.
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
}

