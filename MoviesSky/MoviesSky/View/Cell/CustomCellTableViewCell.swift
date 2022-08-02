//
//  CustomCellTableViewCell.swift
//  MoviesSky
//
//  Created by Gilberto Amaro on 01/08/22.
//

import UIKit
import SnapKit
import SDWebImage

class CustomCellTableViewCell: UITableViewCell {
    
    var myImageCell: UIImageView = {
        let myImageCell = UIImageView(frame: .zero)
        myImageCell.contentMode = .scaleAspectFit
        myImageCell.layer.cornerRadius = 25
        myImageCell.layer.masksToBounds = true
        return myImageCell
    }()
    
    var myLabelName: UILabel = {
        let myLabelName = UILabel(frame: .zero)
        myLabelName.font = .systemFont(ofSize: 25, weight: .bold)
        myLabelName.textColor = .black
        myLabelName.textAlignment = .center
        return myLabelName
    }()
    
    static var identifier: String = "CustomCellTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addElementsView()
        configConstraintsView()
    }
    
    func addElementsView() {
        contentView.addSubview(myImageCell)
        contentView.addSubview(myLabelName)
    }
    
    func configConstraintsView() {
        myImageCell.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(200)
        }
        
        myLabelName.snp.makeConstraints { make in
            make.top.equalTo(myImageCell.snp.bottom).offset(10)
            make.centerX.equalTo(myImageCell.snp.centerX)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
    }
    
    func setupCell(content: Content?) {
        let imageUrl = URL(string: content?.images?.first?.url ?? "")
        myImageCell.sd_setImage(with: imageUrl, completed: nil)
        myLabelName.text = content?.title ?? ""
    }
}
