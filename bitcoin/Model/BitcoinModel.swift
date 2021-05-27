//
//  BitcoinModel.swift
//  bitcoin
//
//  Created by Dastan Zhapay on 8/3/20.
//  Copyright © 2020 Dastan Zhapay. All rights reserved.
//

import Foundation
class BitcoinModel {
    let bpi: [Bpi]
    let chartName:String
    let disclaimer:String
    let time: [timeJson]
    init(bpi: [Bpi],chartName:String,disclaimer:String,time: [timeJson]) {
        self.bpi = bpi
        self.chartName = chartName
        self.disclaimer = disclaimer
        self.time = time
    }
}
class Bpi {
    let EUR: [Euro]
    let GBP: [GBP]
    let USD: [Dollar]
    init(EUR: [Euro],GBP: [GBP], USD: [Dollar]) {
        self.EUR = EUR
        self.GBP = GBP
        self.USD = USD
    }
    
}
class Euro {
    let code:String
    let description:String
    let rate:String
    let rate_float:Double
    let symbol:String
    init(code:String,description:String,rate:String,rate_float:Double,symbol:String) {
        self.code = code
        self.description = description
        self.rate = rate
        self.rate_float = rate_float
        self.symbol = symbol
    }

}
class GBP {
    let code:String
    let description:String
    let rate:String
    let rate_float:Double
    init(code:String,description:String,rate:String,rate_float:Double) {
        self.code = code
        self.description = description
        self.rate = rate
        self.rate_float = rate_float
    }
    
}
class Dollar {
    let code:String
    let description:String
    let rate:String
    let rate_float:Double
    let symbol:String
    init(code:String,description:String,rate:String,rate_float:Double,symbol:String) {
        self.code = code
        self.description = description
        self.rate = rate
        self.rate_float = rate_float
        self.symbol = symbol
    }
    
}

class timeJson {
    let updated:String
    let updatedISO:String
    let updateduk:String
    init(updated:String,updatedISO:String,updateduk:String) {
        self.updated = updated
        self.updatedISO = updatedISO
        self.updateduk = updateduk
    }
}
