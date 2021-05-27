//
//  AlamofireParse.swift
//  bitcoin
//
//  Created by Dastan Zhapay on 8/3/20.
//  Copyright © 2020 Dastan Zhapay. All rights reserved.
//

import Foundation
import Alamofire
class AlamofireParse {
    static func parseJson(url:String,completion: @escaping (_ euro: [Euro],_ dollar: [Dollar]) -> ())  {
        guard let url = URL(string: url) else {return}
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let values):
                let jsonArray = values as! [String:Any]
                var euro = [Euro]()
                var dollar = [Dollar]()
                for (key,value) in jsonArray {
                    if key == "bpi" {
                        print(value)
                        let arrau = value as!  [String:Any]
                        for (key,value) in arrau {
                            if key == "EUR" {
                                let invalue = value as! [String:Any]
                                let euroArray = Euro(code: invalue["code"] as! String, description: invalue["description"] as! String, rate: invalue["rate"] as! String, rate_float: invalue["rate_float"] as! Double, symbol: invalue["symbol"] as! String)
                                euro.append(euroArray)
                            }
                            if key == "USD" {
                                let invalue = value as! [String:Any]
                                let dollarArray = Dollar(code: invalue["code"] as! String, description: invalue["description"] as! String, rate: invalue["rate"] as! String, rate_float: invalue["rate_float"] as! Double, symbol: invalue["symbol"] as! String)
                                dollar.append(dollarArray)
                            }
                        }
                    }
                }
                completion(euro,dollar)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    static func parseJsonKZ(url:String,completion: @escaping (_ kz: [GBP]) -> ())  {
        guard let url = URL(string: url) else {return}
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let values):
                let jsonArray = values as! [String:Any]
                var kz = [GBP]()
                for (key,value) in jsonArray {
                    if key == "bpi" {
                        print(value)
                        let arrau = value as!  [String:Any]
                        for (key,value) in arrau {
                            if key == "KZT" {
                                let invalue = value as! [String:Any]
                                let kzArray = GBP(code: invalue["code"] as! String, description: invalue["description"] as! String, rate: invalue["rate"] as! String, rate_float: invalue["rate_float"] as! Double)
                                kz.append(kzArray)
                            }
                        }
                    }
                }
                completion(kz)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
