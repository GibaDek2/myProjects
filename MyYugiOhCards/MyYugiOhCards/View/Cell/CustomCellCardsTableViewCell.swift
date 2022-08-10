//
//  CustomCellCardsTableViewCell.swift
//  MyYugiOhCards
//
//  Created by Gilberto Amaro on 10/08/22.
//

import UIKit
import SnapKit
import SDWebImage

class CustomCellCardsTableViewCell: UITableViewCell {
    
    var myCardImage: UIImageView = {
        let myCardImage = UIImageView(frame: .zero)
        myCardImage.contentMode = .scaleAspectFit
        myCardImage.layer.masksToBounds = true
        myCardImage.layer.cornerRadius = 25
        return myCardImage
    }()
    
    var myCardLabel: UILabel = {
        let myCardLabel = UILabel(frame: .zero)
        myCardLabel.textAlignment = .center
        myCardLabel.font = .systemFont(ofSize: 30, weight: .bold)
        myCardLabel.textColor = .black
        return myCardLabel
    }()
    
    static var myIdentifier: String = "CustomCellCardsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addElementsView()
        addElementsConstraints()
    }
    
    func addElementsView() {
        contentView.addSubview(myCardImage)
        contentView.addSubview(myCardLabel)
    }
    
    func addElementsConstraints() {
        myCardImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(200)
        }
        
        myCardLabel.snp.makeConstraints { make in
            make.top.equalTo(myCardImage.snp.bottom).offset(10)
            make.centerX.equalTo(myCardImage.snp.centerX)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
    }
    
    func setupCell(datum: Datum?) {
        let imageUrl = URL(string: datum?.cardImages?.first?.imageURL ?? "")
        myCardImage.sd_setImage(with: imageUrl, completed: nil)
        myCardLabel.text = datum?.name ?? ""
    }
}
