//
//  CustomTableViewCellPokemon.swift
//  PokemonViewCodeAPI
//
//  Created by Gilberto Amaro on 16/08/22.
//

import UIKit
import SnapKit

class CustomTableViewCellPokemon: UITableViewCell {
    
    var myPokemonLabelName: UILabel = {
        let myPokemonLabelName = UILabel(frame: .zero)
        myPokemonLabelName.textAlignment = .center
        myPokemonLabelName.font = .systemFont(ofSize: 20, weight: .bold)
        myPokemonLabelName.textColor = .black
        return myPokemonLabelName
    }()
    
    static var myIdentifierCell: String = "CustomTableViewCellPokemon"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addElementView()
        addElementConstraints()
    }
    
    func addElementView() {
        contentView.addSubview(myPokemonLabelName)
    }
    
    func addElementConstraints() {
        myPokemonLabelName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
    }
    
    func setupCell(result: Result?) {
        myPokemonLabelName.text = result?.name ?? ""
    }
    
    func setupCell(ability: Ability?) {
        myPokemonLabelName.text = ability?.ability?.name ?? ""
    }
    
    func setupCell(gameIndex: GameIndex?) {
        myPokemonLabelName.text = gameIndex?.version?.name ?? ""
    }
}
