//
//  ChartViewController.swift
//  bitcoin
//
//  Created by Dastan Zhapay on 8/4/20.
//  Copyright © 2020 Dastan Zhapay. All rights reserved.
//

import UIKit
import SwiftCharts
import Alamofire
class ChartViewController: UIViewController {
    var chartViewWeek: BarsChart?
    var chartViewMonth: BarsChart?
    var chartViewYear: BarsChart?
    var chartView: BarsChart?
    let dateUrl = "https://api.coindesk.com/v1/bpi/historical/close.json"
    var titleValute = ""
    var isSelected = false
    var weekJsonData = [String:Double]()
    var monthJsonData = [String:Double]()
    var yearJsonData = [String:Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chart"
        let vc = ChartViewController()
        chartSettings(bars: [("",0)], color: .clear)
        _ = UINavigationController(rootViewController: vc)
        self.view.backgroundColor = #colorLiteral(red: 0.1764705882, green: 0.1803921569, blue: 0.2901960784, alpha: 1)
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createbutttons()
        
    }
    func createbutttons() {
        guard view.superview != nil else {return}
        let monthButton = UIButton()
        monthButton.setTitle("MONTH", for: .normal)
        monthButton.backgroundColor = UIColor.white
        monthButton.setTitleColor(.black, for: .normal)
        view.addSubview(monthButton)
        monthButton.addTarget(self, action: #selector(monthAction(sender:)), for: .touchUpInside)

        
        monthButton.translatesAutoresizingMaskIntoConstraints = false
        monthButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        monthButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        monthButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        monthButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let weekButton = UIButton()
        weekButton.setTitle("WEEK", for: .normal)
        weekButton.backgroundColor = UIColor.white
        weekButton.setTitleColor(.black, for: .normal)
        view.addSubview(weekButton)
        weekButton.addTarget(self, action: #selector(weekAction(sender:)), for: .touchUpInside)

        weekButton.translatesAutoresizingMaskIntoConstraints = false
        weekButton.topAnchor.constraint(equalTo: monthButton.topAnchor).isActive = true
        weekButton.rightAnchor.constraint(equalTo: monthButton.leftAnchor, constant: -1).isActive = true
        weekButton.widthAnchor.constraint(equalTo: monthButton.widthAnchor).isActive = true
        weekButton.heightAnchor.constraint(equalTo: monthButton.heightAnchor).isActive = true
        
        let yearButton = UIButton()
        yearButton.setTitle("YEAR", for: .normal)
        yearButton.backgroundColor = UIColor.white
        yearButton.setTitleColor(.black, for: .normal)
        view.addSubview(yearButton)
        yearButton.addTarget(self, action: #selector(yearAction(sender:)), for: .touchUpInside)
        
        yearButton.translatesAutoresizingMaskIntoConstraints = false
        yearButton.topAnchor.constraint(equalTo: monthButton.topAnchor).isActive = true
        yearButton.leftAnchor.constraint(equalTo: monthButton.rightAnchor, constant: 1).isActive = true
        yearButton.widthAnchor.constraint(equalTo: monthButton.widthAnchor).isActive = true
        yearButton.heightAnchor.constraint(equalTo: monthButton.heightAnchor).isActive = true

    }
    @objc func monthAction(sender:UIButton) {
        DataJsonParse(startDay: "2019-07-04", endDay: "2019-08-04") { (dataJson) in
            self.monthJsonData = dataJson
            var bars = [(String,Double)]()
            let sortJson = self.monthJsonData.sorted(){$0 < $1}
            var moneyArray = [Double]()
            for (_,value) in sortJson {
                moneyArray.append(value)
            }
            let avgfirstWeek = self.average(of: moneyArray[0...6])
            let avgSecondWeek = self.average(of: moneyArray[7...12])
            let avgThirdWeek = self.average(of: moneyArray[13...19])
            let avgFourthWeek = self.average(of: moneyArray[20...24])
            let avgFifthWeek = self.average(of: moneyArray[25...30])
            
            bars.append(("4 Aug", avgfirstWeek))
            bars.append(("28 Jul", avgSecondWeek))
            bars.append(("21 Jul", avgThirdWeek))
            bars.append(("14 Jul", avgFourthWeek))
            bars.append(("7 Jul", avgFifthWeek))
            
            self.chartViewYear?.view.isHidden = true
            self.chartView?.view.isHidden = true
            self.chartViewWeek?.view.isHidden = true
            
            let font  = UIFont.systemFont(ofSize: 13)

            let chartConfig = BarsChartConfig(valsAxisConfig: ChartAxisConfig(from: 0, to: 12000, by: 1000), xAxisLabelSettings: ChartLabelSettings(font: font, fontColor: .white), yAxisLabelSettings: ChartLabelSettings(font: font, fontColor: .white))
            let frame = CGRect(x: 0, y: 250, width: self.view.frame.size.width, height: 450)
            let chart = BarsChart(frame: frame, chartConfig: chartConfig, xTitle: "Week", yTitle: self.titleValute, bars: bars,
                                  color: UIColor.red,
                                  barWidth: 15)
            self.view.addSubview(chart.view)
            self.chartViewMonth = chart
            self.chartViewMonth!.view.isHidden = false
        }
    }
    @objc func weekAction(sender:UIButton) {
        DataJsonParse(startDay: "2019-07-28", endDay: "2019-08-04") { (dataJson) in
            self.weekJsonData = dataJson
            var bars = [(String,Double)]()
            let sortJson = self.weekJsonData.sorted(){$0 < $1}
            for (key,value) in sortJson {
                let formatDay = self.convertDateFormater(key)
                
                bars.append((formatDay, value))
            }
            
            self.chartViewYear?.view.isHidden = true
            self.chartView?.view.isHidden = true
            self.chartViewMonth?.view.isHidden = true
            
            let font = UIFont.systemFont(ofSize: 12)

            let chartConfig = BarsChartConfig(valsAxisConfig: ChartAxisConfig(from: 0, to: 12000, by: 1000), xAxisLabelSettings: ChartLabelSettings(font: font, fontColor: .white), yAxisLabelSettings: ChartLabelSettings(font: font, fontColor: .white))
            let frame = CGRect(x: 0, y: 250, width: self.view.frame.size.width, height: 450)
            let chart = BarsChart(frame: frame, chartConfig: chartConfig, xTitle: "Week", yTitle: self.titleValute, bars: bars,
                                  color: UIColor.yellow,
                                  barWidth: 15)
            self.view.addSubview(chart.view)
            self.chartViewWeek = chart
            self.chartViewWeek!.view.isHidden = false
        }
        
    }
    @objc func yearAction(sender:UIButton) {
        DataJsonParse(startDay: "2018-08-04", endDay: "2019-08-04") { (dataJson) in
            self.yearJsonData = dataJson
            var bars = [(String,Double)]()
            let sortJson = self.yearJsonData.sorted(){$0 < $1}
            var moneyArray = [Double]()
            for (_,value) in sortJson {
                moneyArray.append(value)
            }
            
            let avgMonth1 = self.averageYear(of: moneyArray[0...30])
            let avgMonth2 = self.averageYear(of: moneyArray[31...60])
            let avgMonth3 = self.averageYear(of: moneyArray[61...90])
            let avgMonth4 = self.averageYear(of: moneyArray[91...120])
            let avgMonth5 = self.averageYear(of: moneyArray[121...150])
            let avgMonth6 = self.averageYear(of: moneyArray[151...180])
            let avgMonth7 = self.averageYear(of: moneyArray[181...210])
            let avgMonth8 = self.averageYear(of: moneyArray[211...240])
            let avgMonth9 = self.averageYear(of: moneyArray[241...270])
            let avgMonth10 = self.averageYear(of: moneyArray[271...300])
            let avgMonth11 = self.averageYear(of: moneyArray[301...330])
            let avgMonth12 = self.averageYear(of: moneyArray[331...360])

            bars.append(("Aug", avgMonth1))
            bars.append(("Jul", avgMonth2))
            bars.append(("Jun", avgMonth3))
            bars.append(("May", avgMonth4))
            bars.append(("Apr", avgMonth5))
            bars.append(("Mar ", avgMonth6))
            bars.append(("Feb", avgMonth7))
            bars.append(("Jan", avgMonth8))
            bars.append(("Dec", avgMonth9))
            bars.append(("Nov", avgMonth10))
            bars.append(("Oct", avgMonth11))
            bars.append(("Sep", avgMonth12))
            
            self.chartViewMonth?.view.isHidden = true
            self.chartView?.view.isHidden = true
            self.chartViewWeek?.view.isHidden = true
            
            let font = UIFont.systemFont(ofSize: 12)
            
            let chartConfig = BarsChartConfig(valsAxisConfig: ChartAxisConfig(from: 0, to: 12000, by: 1000), xAxisLabelSettings: ChartLabelSettings(font: font, fontColor: .white), yAxisLabelSettings: ChartLabelSettings(font: font, fontColor: .white))
            let frame = CGRect(x: 0, y: 250, width: self.view.frame.size.width, height: 450)
            let chart = BarsChart(frame: frame, chartConfig: chartConfig, xTitle: "Year", yTitle: self.titleValute, bars: bars,
                color: UIColor.blue,
                barWidth: 15)
            self.view.addSubview(chart.view)
            self.chartViewYear = chart
            self.chartViewYear!.view.isHidden = false
        }
    }
    func chartSettings(bars:[(String,Double)],color:UIColor) {
        let font  = UIFont.systemFont(ofSize: 13)
        let chartConfig = BarsChartConfig(valsAxisConfig: ChartAxisConfig(from: 0, to: 12000, by: 1000), xAxisLabelSettings: ChartLabelSettings(font: font, fontColor: .white), yAxisLabelSettings: ChartLabelSettings(font: font, fontColor: .white))
        let frame = CGRect(x: 0, y: 250, width: self.view.frame.size.width, height: 450)
        let chart = BarsChart(frame: frame, chartConfig: chartConfig, xTitle: "", yTitle: "", bars: bars,
            color: color,
            barWidth: 15)
        self.view.addSubview(chart.view)
        self.chartView = chart
        
        
    }
    
    func DataJsonParse(startDay:String,endDay:String,completion:@escaping (_ dataJson: [String:Double]) -> ()) {
        guard let url = URL(string: "\(dateUrl)?start=\(startDay)&end=\(endDay)") else {return}
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                print(value)
                let json = value as! [String:Any]
                var data = [String:Double]()
                for (key,value) in json {
                    if key == "bpi" {
                        let dataArray = value as! [String:Double]
                        data = dataArray
                        print(dataArray)
                    }
                }
                completion(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func convertDateFormater(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "d MMM"
        return  dateFormatter.string(from: date!)
        
    }
    func average<C: Collection>(of c: C) -> Double where C.Element == Double {
        precondition(!c.isEmpty, "Cannot compute average of empty collection")
        return Double(c.reduce(0, +))/Double(c.count)
    }
    func averageYear<C: Collection>(of c: C) -> Double where C.Element == Double {
        precondition(!c.isEmpty, "Cannot compute average of empty collection")
        return Double(c.reduce(0, +))/Double(30.0)
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
