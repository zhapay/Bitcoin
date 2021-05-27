//
//  TableCell.swift
//  bitcoin
//
//  Created by Dastan Zhapay on 8/3/20.
//  Copyright © 2020 Dastan Zhapay. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    let label:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    let imageview:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private func addView() {
        addSubview(label)
        addSubview(imageview)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 32).isActive = true
        imageview.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 19).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 32).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: 32).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 26).isActive = true
        label.leftAnchor.constraint(equalTo: imageview.rightAnchor, constant: 32).isActive = true
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
        addView()
        backgroundColor = #colorLiteral(red: 0.3019607843, green: 0.4196078431, blue: 0.6156862745, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
