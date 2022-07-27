//
//  ViewController.swift
//  YugiCards
//
//  Created by Gilberto Amaro on 27/07/22.
//

import UIKit

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
    }
    
    func addElementsViews() {
        view.addSubview(myTableViewCards)
    }


}

