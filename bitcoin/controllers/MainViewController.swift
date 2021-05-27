//
//  MainViewController.swift
//  bitcoin
//
//  Created by Dastan Zhapay on 8/3/20.
//  Copyright © 2020 Dastan Zhapay. All rights reserved.
//

import UIKit
import SwiftCharts
class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let imageview = UIImageView()
    let moneyLabel = UILabel()
    let tableView = UITableView()
    var textEuro = ""
    var textKZ = ""
    var textDollar = ""
    let colorArrray = [#colorLiteral(red: 0.3019607843, green: 0.4196078431, blue: 0.6156862745, alpha: 1),#colorLiteral(red: 0.9921568627, green: 0.2705882353, blue: 0.662745098, alpha: 1),#colorLiteral(red: 0.5529411765, green: 0.3098039216, blue: 0.862745098, alpha: 1)]
    var descriptionEuro = ""
    var descriptionKZ = ""
    var descriptionDollar = ""
    var valuteName = [String]()
    var arrayTextValute = [String]()
    let identy = "ValuteCell"
    let arrayofImage = ["united-states","european-union","kazakhstan"]
    let arrayofValute = ["euro-currency-symbol","dollar-symbol","akwa"]
    let url = "https://api.coindesk.com/v1/bpi/currentprice.json"
    let urlKZ = "https://api.coindesk.com/v1/bpi/currentprice/KZT.json"
    var euro = [Euro]()
    var kz = [GBP]()
    var dollar = [Dollar]()
    var getData = false
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJson()
        tableView.frame = CGRect(x: 16, y: 232, width: self.view.frame.size.width-32, height: self.self.view.frame.size.height-464)
        tableView.backgroundColor = #colorLiteral(red: 0.1764705882, green: 0.1803921569, blue: 0.2901960784, alpha: 1)
        tableView.separatorStyle = .none
        tableView.register(ValuteTableViewCell.self, forCellReuseIdentifier: identy)
        tableView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: identy, for: indexPath) as! ValuteTableViewCell
        if getData {
        cell.layer.cornerRadius = 10
        cell.selectionStyle = .none
        cell.valuteView.backgroundColor = colorArrray[indexPath.row]
        cell.moneyLabel.text = arrayTextValute[indexPath.row]
        cell.countryImage.image = UIImage(named: arrayofImage[indexPath.row])
        cell.valuteImageView.image = UIImage(named: arrayofValute[indexPath.row])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Chartvc = ChartViewController()
        Chartvc.titleValute = valuteName[indexPath.row]
        navigationController?.pushViewController(Chartvc, animated: true)
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewSettings()
        tableView.reloadData()

    }
    func viewSettings() {
        guard let viewSetting = view.superview else {return}
        imageview.contentMode = .scaleAspectFit
        self.view.addSubview(imageview)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.centerXAnchor.constraint(equalTo: viewSetting.centerXAnchor).isActive = true
        imageview.topAnchor.constraint(equalTo: viewSetting.topAnchor, constant: 100).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 128).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageview.image = UIImage(named: "bit")
    }
    func parseJson() {
        AlamofireParse.parseJson(url: url) { (euro, dollar) in
            self.euro = euro
            self.dollar = dollar
            for text in euro {
                self.textEuro = String(Int(text.rate_float))
                self.descriptionEuro = text.description
            }
            for text in dollar {
                self.textDollar = String(Int(text.rate_float))
                self.descriptionDollar = text.description
            }
            AlamofireParse.parseJsonKZ(url: self.urlKZ, completion: { (kz) in
                self.getData = true
                self.tableView.isHidden = false
                self.kz = kz
                for text in kz {
                    self.textKZ = String(Int(text.rate_float))
                    self.descriptionKZ = text.description
                }
                self.arrayTextValute = [self.textEuro,self.textDollar,self.textKZ]
                self.valuteName = [self.descriptionDollar,self.descriptionEuro,self.descriptionKZ]
                print(self.arrayTextValute)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }
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
