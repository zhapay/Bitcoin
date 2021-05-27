//
//  InfoViewController.swift
//  bitcoin
//
//  Created by Dastan Zhapay on 8/4/20.
//  Copyright © 2020 Dastan Zhapay. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    var dateName = UILabel()
    var idName = UILabel()
    var typeName = UILabel()
    var priceName = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        settingsViews()
    }
    func settingsViews() {
        let imageview = UIImageView()
        imageview.frame = CGRect(x: 0, y: 0, width: 256, height: 256)
        imageview.contentMode = .scaleAspectFit
        
        view.addSubview(imageview)
        imageview.image = #imageLiteral(resourceName: "big")
        imageview.layer.cornerRadius = imageview.frame.width/2
        imageview.layer.borderColor = UIColor.white.cgColor
        imageview.layer.borderWidth = 3
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageview.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 256).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: 256).isActive = true
        
        let dataView = UIView()
        dataView.frame = CGRect(x: 32, y: 382, width: self.view.frame.size.width - 64, height: 200)
        dataView.backgroundColor = #colorLiteral(red: 0.3019607843, green: 0.4196078431, blue: 0.6156862745, alpha: 1)
        self.view.addSubview(dataView)
        dataView.layer.cornerRadius = 10
        
        let labelName = UILabel()
        dataView.addSubview(labelName)
        labelName.textColor = .white
        labelName.font = UIFont.boldSystemFont(ofSize: 18)
        labelName.text = "Created"
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.topAnchor.constraint(equalTo: dataView.topAnchor, constant: 16).isActive = true
        labelName.leftAnchor.constraint(equalTo: dataView.leftAnchor, constant: 32).isActive = true
        
        dataView.addSubview(dateName)
        dateName.textColor = .white
        dateName.font = UIFont.systemFont(ofSize: 16)
        dateName.translatesAutoresizingMaskIntoConstraints = false
        dateName.topAnchor.constraint(equalTo: dataView.topAnchor, constant: 16).isActive = true
        dateName.leftAnchor.constraint(equalTo: labelName.rightAnchor, constant: 32).isActive = true
        
        let lineView1 = UIView()
        lineView1.frame = CGRect(x: 0, y: dataView.frame.size.height/4, width: dataView.frame.size.width, height: 1)
        dataView.addSubview(lineView1)
        lineView1.backgroundColor =  #colorLiteral(red: 0.3019607843, green: 0.4196078431, blue: 0.6156862745, alpha: 1)
        
        let idLabel = UILabel()
        dataView.addSubview(idLabel)
        idLabel.textColor = .white
        idLabel.font = UIFont.boldSystemFont(ofSize: 18)
        idLabel.text = "ID"
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.topAnchor.constraint(equalTo: lineView1.topAnchor, constant: 16).isActive = true
        idLabel.leftAnchor.constraint(equalTo: dataView.leftAnchor, constant: 32).isActive = true
        
        dataView.addSubview(idName)
        idName.textColor = .white
        idName.font = UIFont.systemFont(ofSize: 16)
        idName.translatesAutoresizingMaskIntoConstraints = false
        idName.topAnchor.constraint(equalTo: idLabel.topAnchor).isActive = true
        idName.leftAnchor.constraint(equalTo: dateName.leftAnchor).isActive = true
        
        let lineView2 = UIView()
        lineView2.frame = CGRect(x: 0, y: dataView.frame.size.height/4 * 2, width: dataView.frame.size.width, height: 1)
        dataView.addSubview(lineView2)
        lineView2.backgroundColor =  #colorLiteral(red: 0.3019607843, green: 0.4196078431, blue: 0.6156862745, alpha: 1)
        
        let priceLabel = UILabel()
        dataView.addSubview(priceLabel)
        priceLabel.textColor = .white
        priceLabel.font = UIFont.boldSystemFont(ofSize: 18)
        priceLabel.text = "Price"
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: lineView2.topAnchor, constant: 16).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: dataView.leftAnchor, constant: 32).isActive = true
        
        dataView.addSubview(priceName)
        priceName.textColor = .white
        priceName.font = UIFont.systemFont(ofSize: 16)
        priceName.translatesAutoresizingMaskIntoConstraints = false
        priceName.topAnchor.constraint(equalTo: priceLabel.topAnchor).isActive = true
        priceName.leftAnchor.constraint(equalTo: dateName.leftAnchor).isActive = true
        
        let lineView3 = UIView()
        lineView3.frame = CGRect(x: 0, y: dataView.frame.size.height/4 * 3, width: dataView.frame.size.width, height: 1)
        dataView.addSubview(lineView3)
        lineView3.backgroundColor =  #colorLiteral(red: 0.3019607843, green: 0.4196078431, blue: 0.6156862745, alpha: 1)
        
        let typeLabel = UILabel()
        dataView.addSubview(typeLabel)
        typeLabel.textColor = .white
        typeLabel.font = UIFont.boldSystemFont(ofSize: 18)
        typeLabel.text = "Type"
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.topAnchor.constraint(equalTo: lineView3.topAnchor, constant: 16).isActive = true
        typeLabel.leftAnchor.constraint(equalTo: dataView.leftAnchor, constant: 32).isActive = true
        
        dataView.addSubview(typeName)
        typeName.textColor = .white
        typeName.font = UIFont.systemFont(ofSize: 16)
        typeName.translatesAutoresizingMaskIntoConstraints = false
        typeName.topAnchor.constraint(equalTo: typeLabel.topAnchor).isActive = true
        typeName.leftAnchor.constraint(equalTo: dateName.leftAnchor).isActive = true
        
    }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
