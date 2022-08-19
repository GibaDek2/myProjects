//
//  PokemonDetailViewController.swift
//  PokemonViewCodeAPI
//
//  Created by Gilberto Amaro on 16/08/22.
//

import UIKit
import SnapKit
import SDWebImage

class PokemonDetailViewController: UIViewController {
    let controller = PokemonDetailController()
    
    var myPokemonDetailImage: UIImageView = {
        let myPokemonDetailImage = UIImageView(frame: .zero)
        myPokemonDetailImage.contentMode = .scaleAspectFit
        myPokemonDetailImage.layer.masksToBounds = true
        myPokemonDetailImage.layer.cornerRadius = 0
        return myPokemonDetailImage
    }()
    
    var myPokemonDetailLabel: UILabel = {
        let myPokemonDetailLabel = UILabel(frame: .zero)
        myPokemonDetailLabel.textAlignment = .center
        myPokemonDetailLabel.font = .systemFont(ofSize: 30, weight: .bold)
        myPokemonDetailLabel.textColor = .white
        myPokemonDetailLabel.clipsToBounds = true
        myPokemonDetailLabel.backgroundColor = .black
        myPokemonDetailLabel.layer.cornerRadius = 20
        return myPokemonDetailLabel
    }()
    
    var myAbilitiesLabel: UILabel = {
        let myAbilitiesLabel = UILabel(frame: .zero)
        myAbilitiesLabel.text = "Abilities"
        myAbilitiesLabel.textAlignment = .center
        myAbilitiesLabel.font = .systemFont(ofSize: 15, weight: .bold)
        myAbilitiesLabel.textColor = .white
        myAbilitiesLabel.clipsToBounds = true
        myAbilitiesLabel.backgroundColor = .darkGray
        myAbilitiesLabel.layer.cornerRadius = 15
        return myAbilitiesLabel
    }()
    
    var myTableViewAbilities: UITableView = {
        let myTableViewAbilities = UITableView(frame: .zero)
        myTableViewAbilities.register(CustomTableViewCellPokemon.self, forCellReuseIdentifier: CustomTableViewCellPokemon.myIdentifierCell)
        return myTableViewAbilities
    }()
    
    var myGamesLabel: UILabel = {
        let myGamesLabel = UILabel(frame: .zero)
        myGamesLabel.text = "Games"
        myGamesLabel.textAlignment = .center
        myGamesLabel.font = .systemFont(ofSize: 15, weight: .bold)
        myGamesLabel.textColor = .white
        myGamesLabel.clipsToBounds = true
        myGamesLabel.backgroundColor = .darkGray
        myGamesLabel.layer.cornerRadius = 15
        return myGamesLabel
    }()
    
    var myTableViewGames: UITableView = {
        let myTableViewGames = UITableView(frame: .zero)
        myTableViewGames.register(CustomTableViewCellPokemon.self, forCellReuseIdentifier: CustomTableViewCellPokemon.myIdentifierCell)
        return myTableViewGames
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = controller.titleOnTop
        addElementsView()
        addElementsConstraints()
        setupTableView()
        myRequest()
    }
    
    func addElementsView() {
        view.addSubview(myPokemonDetailImage)
        view.addSubview(myPokemonDetailLabel)
        view.addSubview(myAbilitiesLabel)
        view.addSubview(myTableViewAbilities)
        view.addSubview(myGamesLabel)
        view.addSubview(myTableViewGames)
    }
    
    func addElementsConstraints() {
        myPokemonDetailImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(200)
        }
        
        myPokemonDetailLabel.snp.makeConstraints { make in
            make.top.equalTo(myPokemonDetailImage.snp.bottom).offset(0)
            make.centerX.equalTo(myPokemonDetailImage.snp.centerX)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        myAbilitiesLabel.snp.makeConstraints { make in
            make.top.equalTo(myPokemonDetailLabel.snp.bottom).offset(30)
            make.centerX.equalTo(myPokemonDetailLabel.snp.centerX)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        myTableViewAbilities.snp.makeConstraints { make in
            make.top.equalTo(myAbilitiesLabel.snp.bottom).offset(5)
            make.centerX.equalTo(myAbilitiesLabel.snp.centerX)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        myGamesLabel.snp.makeConstraints { make in
            make.top.equalTo(myTableViewAbilities.snp.bottom).offset(30)
            make.centerX.equalTo(myTableViewAbilities.snp.centerX)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        myTableViewGames.snp.makeConstraints { make in
            make.top.equalTo(myGamesLabel.snp.bottom).offset(5)
            make.centerX.equalTo(myGamesLabel.snp.centerX)
            make.width.equalTo(200)
            make.height.equalTo(330)
        }
    }
    
    func setupTableView() {
        self.myTableViewAbilities.delegate = self
        self.myTableViewGames.delegate = self
        self.myTableViewAbilities.dataSource = self
        self.myTableViewGames.dataSource = self
    }
    
    func setupCell() {
        self.myTableViewAbilities.reloadData()
        self.myTableViewGames.reloadData()
        myPokemonDetailImage.sd_setImage(with: controller.pokemonImageUrl, completed: nil)
        myPokemonDetailLabel.text = controller.pokemonName
    }
    
    func showAlert() {
        let alert = UIAlertController(title: controller.showAlert, message: controller.showMessage, preferredStyle: .alert)
        let button = UIAlertAction(title: controller.showButton, style: .destructive, handler: nil)
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
    }
    
    func myRequest() {
        controller.requestDetailController(url: controller.pokemonUrl) { [weak self] success in
            if success {
                self?.setupCell()
            } else {
                self?.showAlert()
            }
        }
    }
}

extension PokemonDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == myTableViewAbilities {
            return controller.numberOfRowAbilities
        } else {
            return controller.numberOfRowGames
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == myTableViewAbilities {
            if let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCellPokemon.myIdentifierCell, for: indexPath) as? CustomTableViewCellPokemon {
                cell.setupCell(ability: controller.getAbilitiesByIndex(indexPath: indexPath))
                return cell
            }
        } else {
            if tableView == myTableViewGames {
                if let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCellPokemon.myIdentifierCell, for: indexPath) as? CustomTableViewCellPokemon {
                    cell.setupCell(gameIndex: controller.getGamesByIndex(indexPath: indexPath))
                    return cell
                }
            }
        }
        return UITableViewCell()
    }
}
