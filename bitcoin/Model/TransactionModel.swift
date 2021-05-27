//
//  ChartModel.swift
//  bitcoin
//
//  Created by Dastan Zhapay on 8/4/20.
//  Copyright © 2020 Dastan Zhapay. All rights reserved.
//

import Foundation

class TransactionModel {
    let date: String
    let tid: Int
    let price: String
    let type: Int
    let amount: String
    init(json: [String:Any]) {
        let date = json["date"] as! String
        let tid = json["tid"] as! Int
        let price = json["price"] as! String
        let type = json["type"] as! Int
        let amount = json["amount"] as! String
        
        self.date = date
        self.tid = tid
        self.price = price
        self.type = type
        self.amount = amount
    }
    
}
