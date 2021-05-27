//
//  ValuteTableViewCell.swift
//  bitcoin
//
//  Created by Dastan Zhapay on 8/5/20.
//  Copyright © 2020 Dastan Zhapay. All rights reserved.
//

import UIKit

class ValuteTableViewCell: UITableViewCell {
    let valuteView: UIView = {
        let valuteview = UIView()
        return valuteview
    }()
    var countryImage: UIImageView = {
        let countryImage = UIImageView()
        return countryImage
    }()
    var valuteImageView: UIImageView = {
        let valuteImageView = UIImageView()
        return valuteImageView
    }()
    var moneyLabel: UILabel = {
        let moneyLabel = UILabel()
        return moneyLabel
    }()
    private func settingsViews() {
        addSubview(valuteView)
        valuteView.frame = CGRect(x: 0, y: 8 , width: contentView.frame.size.width + 52, height: 100)
        valuteView.layer.cornerRadius = 10
        
        valuteView.addSubview(countryImage)
        countryImage.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        countryImage.layer.cornerRadius = countryImage.frame.size.width/2
        countryImage.layer.masksToBounds = true
        countryImage.layer.borderColor = UIColor.white.cgColor
        countryImage.layer.borderWidth = 1
        countryImage.translatesAutoresizingMaskIntoConstraints = false
        countryImage.topAnchor.constraint(equalTo: valuteView.topAnchor, constant: 16).isActive = true
        countryImage.leadingAnchor.constraint(equalTo: valuteView.leadingAnchor, constant: 16).isActive = true
        countryImage.widthAnchor.constraint(equalToConstant: 64).isActive = true
        countryImage.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        valuteView.addSubview(valuteImageView)
        valuteImageView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        valuteImageView.translatesAutoresizingMaskIntoConstraints = false
        valuteImageView.leftAnchor.constraint(equalTo: countryImage.rightAnchor, constant: 8).isActive = true
        valuteImageView.centerYAnchor.constraint(equalTo: countryImage.centerYAnchor).isActive = true
        valuteImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        valuteImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        valuteView.addSubview(moneyLabel)
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        moneyLabel.rightAnchor.constraint(equalTo: valuteView.rightAnchor, constant: -16).isActive = true
        moneyLabel.centerYAnchor.constraint(equalTo: countryImage.centerYAnchor).isActive = true
        moneyLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        moneyLabel.font = UIFont.systemFont(ofSize: 43)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = #colorLiteral(red: 0.1764705882, green: 0.1803921569, blue: 0.2901960784, alpha: 1)
        settingsViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
