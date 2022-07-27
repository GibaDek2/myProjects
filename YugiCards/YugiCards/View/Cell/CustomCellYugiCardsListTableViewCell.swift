//
//  CustomCellYugiCardsListTableViewCell.swift
//  YugiCards
//
//  Created by Gilberto Amaro on 27/07/22.
//

import UIKit
import SDWebImage
import SnapKit

class CustomCellYugiCardsListTableViewCell: UITableViewCell {
    
    var myImageCell: UIImageView = {
        let myImageCell = UIImageView(frame: .zero)
        myImageCell.contentMode = .scaleAspectFit
        myImageCell.layer.cornerRadius = 0
        myImageCell.layer.masksToBounds = true
        return myImageCell
    }()
    
    var myLabelCell: UILabel = {
        let myLabelCell = UILabel(frame: .zero)
        myLabelCell.textAlignment = .center
        myLabelCell.textColor = .black
        myLabelCell.font = .systemFont(ofSize: 15, weight: .bold)
        return myLabelCell
    }()
    
    static var identifier: String = "CustomCellYugiCardsListTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addElementsViews()
        configConstraintsViews()
    }
    
    func addElementsViews() {
        contentView.addSubview(myImageCell)
        contentView.addSubview(myLabelCell)
    }
    
    func configConstraintsViews() {
        myImageCell.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        myLabelCell.snp.makeConstraints { make in
            make.top.equalTo(myImageCell.snp.bottom).offset(10)
            make.centerX.equalTo(myImageCell.snp.centerX)
            make.width.equalTo(250)
            make.height.equalTo(30)
        }
    }
    
    func setupCell(datum: Datum?) {
        let url = URL(string: datum?.cardImages?.first?.imageURL ?? "")
        myImageCell.sd_setImage(with: url, completed: nil)
        myLabelCell.text = datum?.name ?? ""
    }
}
