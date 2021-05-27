//
//  TransactionViewController.swift
//  bitcoin
//
//  Created by Dastan Zhapay on 8/3/20.
//  Copyright © 2020 Dastan Zhapay. All rights reserved.
//

import UIKit
import Alamofire
class TransactionViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let tableView = UITableView()
    let url = "https://www.bitstamp.net/api/transactions/"
    let identy = "CellID"
    var transactionArray = [TransactionModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParse()
        tableView.frame = CGRect(x: 32, y: 128, width: self.view.frame.size.width-64, height: self.view.frame.size.height-256)
        tableView.backgroundColor = #colorLiteral(red: 0.3019607843, green: 0.4196078431, blue: 0.6156862745, alpha: 1)
        tableView.layer.cornerRadius = 10
        tableView.register(TableCell.self, forCellReuseIdentifier: identy)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        self.view.addSubview(tableView)
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identy, for: indexPath) as! TableCell
        cell.selectionStyle = .none
        cell.label.text = String(transactionArray[indexPath.row].tid)
        cell.imageview.changeColor = .white
        cell.imageview.image = #imageLiteral(resourceName: "transaction")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = InfoViewController()
        let date = Date(timeIntervalSince1970: Double(transactionArray[indexPath.row].date) as! TimeInterval)
        
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "MMM dd YYYY hh:mm"
        
        let dateString = dayTimePeriodFormatter.string(from: date)
        vc.dateName.text = dateString
        vc.idName.text = String(transactionArray[indexPath.row].tid)
        vc.priceName.text = "\(transactionArray[indexPath.row].price)$"
        if transactionArray[indexPath.row].type == 0 {
            vc.typeName.text = "buy"
        } else {
            vc.typeName.text = "sell"
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    func jsonParse() {
        guard let url = URL(string: url) else {return}
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let jsonModel = value as! Array<[String:Any]>
                for item in jsonModel {
                    let json = TransactionModel(json: item)
                    self.transactionArray.append(json)
                }
                print(self.transactionArray.count)
            case .failure(let error):
                print(error.localizedDescription)
            }
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
extension UIImageView {
    @IBInspectable
    var changeColor: UIColor? {
        get {
            let color = UIColor(cgColor: layer.borderColor!);
            return color
        }
        set {
            let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
            self.image = templateImage
            self.tintColor = newValue
        }
    }
}
