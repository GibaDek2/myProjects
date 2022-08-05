//
//  MoviesDetailViewController.swift
//  MoviesSky
//
//  Created by Gilberto Amaro on 05/08/22.
//

import UIKit
import SnapKit
import SDWebImage

class MoviesDetailViewController: UIViewController {
    let controller = MoviesDetailController()
    
    var myImageCell: UIImageView = {
        let myImageCell = UIImageView(frame: .zero)
        myImageCell.contentMode = .scaleAspectFit
        myImageCell.layer.cornerRadius = 30
        myImageCell.layer.masksToBounds = true
        return myImageCell
    }()
    
    var myTitleLabel: UILabel = {
        let myTitleLabel = UILabel(frame: .zero)
        myTitleLabel.textAlignment = .center
        myTitleLabel.font = .systemFont(ofSize: 25, weight: .bold)
        myTitleLabel.textColor = .white
        myTitleLabel.clipsToBounds = true
        myTitleLabel.backgroundColor = .black
        myTitleLabel.layer.cornerRadius = 20
        return myTitleLabel
    }()
    
    var myDescription: UILabel = {
        let myDescription = UILabel(frame: .zero)
        myDescription.textAlignment = .center
        myDescription.font = .systemFont(ofSize: 18, weight: .bold)
        myDescription.textColor = .black
        myDescription.numberOfLines = 0
        return myDescription
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        elementsView()
        elementsConstraints()
        setupCell()
    }
    
    func elementsView() {
        view.addSubview(myImageCell)
        view.addSubview(myTitleLabel)
        view.addSubview(myDescription)
    }
    
    func elementsConstraints() {
        myImageCell.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(400)
        }
        
        myTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(myImageCell.snp.bottom).offset(12)
            make.centerX.equalTo(myImageCell.snp.centerX)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        
        myDescription.snp.makeConstraints { make in
            make.top.equalTo(myTitleLabel.snp.bottom).offset(10)
            make.centerX.equalTo(myTitleLabel.snp.centerX)
            make.width.equalTo(200)
            make.height.equalTo(300)
        }
    }
    
    func setupCell() {
        myImageCell.sd_setImage(with: controller.movieUrl, completed: nil)
        myTitleLabel.text = controller.movieTitle
        myDescription.text = controller.movieDescription
    }
}
