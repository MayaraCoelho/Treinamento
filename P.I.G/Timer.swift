//
//  Timer.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class Timer:NSObject, NSCoding {
    
    var lastLocalUpdate:NSDate?
    
    var lastEnterpriseUpdate:NSDate?
    
    var timer = NSTimer()
    
    
    func startUpdates(){
        
        self.updateEnterprises()
        self.inflationUpdate()
        
        NSTimer.scheduledTimerWithTimeInterval(15, target: self, selector: "updateEnterprises", userInfo: "nil", repeats: true)
        
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "localUpdate", userInfo: "nil", repeats: true)
        
        NSTimer.scheduledTimerWithTimeInterval(15, target: self, selector: "inflationUpdate", userInfo: "nil", repeats: true)
        
    }
    
    func inflationUpdate(){
        InflationUpdater().update()
    }
    
    func updateEnterprises(){
        EnterpriseValueUpdater().updateAllEnterprises()
        self.lastEnterpriseUpdate = NSDate()
    }
    
    
    func localUpdate(){
        let now = NSDate()
        
        if (self.lastLocalUpdate != nil){
            var timeInterval = now.timeIntervalSinceDate(self.lastLocalUpdate!)
            
            
            if (timeInterval < 1){
                timeInterval = 1
            } else if (timeInterval < 1.5){
                timeInterval = 1
            }
            

            AppData.sharedInstance.player.balance = AppData.sharedInstance.player.balance + (AppData.sharedInstance.player.incomePerSecond() * timeInterval)
            
            
            if (AppData.sharedInstance.player.lowRiskInvestments[0].currentValue > 0){
                let multiplier = Double(AppData.sharedInstance.player.lowRiskInvestments[0].interestRatePerSecond())
                let interest = multiplier * timeInterval * AppData.sharedInstance.player.lowRiskInvestments[0].currentValue
                AppData.sharedInstance.player.lowRiskInvestments[0].currentValue = AppData.sharedInstance.player.lowRiskInvestments[0].currentValue + interest
         
            }
            
            if (AppData.sharedInstance.player.lowRiskInvestments[1].currentValue > 0){
                let currentInterval = now.timeIntervalSinceDate(AppData.sharedInstance.player.lowRiskInvestments[1].startDate)
                if (currentInterval <= AppData.sharedInstance.player.lowRiskInvestments[1].investmentTerm){
                    let multiplier = Double(AppData.sharedInstance.player.lowRiskInvestments[1].interestRatePerSecond())
                    let interest = multiplier * timeInterval * AppData.sharedInstance.player.lowRiskInvestments[1].currentValue
                    AppData.sharedInstance.player.lowRiskInvestments[1].currentValue = AppData.sharedInstance.player.lowRiskInvestments[1].currentValue + interest
                } else if (currentInterval > AppData.sharedInstance.player.lowRiskInvestments[1].investmentTerm){
                    let multiplier = Double(AppData.sharedInstance.player.lowRiskInvestments[1].interestRatePerSecond())
                    let interest = multiplier * AppData.sharedInstance.player.lowRiskInvestments[1].investmentTerm * AppData.sharedInstance.player.lowRiskInvestments[1].startingValue
                    AppData.sharedInstance.player.lowRiskInvestments[1].currentValue = AppData.sharedInstance.player.lowRiskInvestments[1].startingValue + interest
                }
            }
            
          
        }
        
        
        self.lastLocalUpdate = now
        
        // APAGAR ESTA LINHA ---- FIX ME
        TimerDAO.sharedInstance.saveTimer()
    }
    
    
    
    
    //NSCoding Methods
    required convenience init?(coder decoder: NSCoder) {
        
        guard let dLastLocalUpdate = decoder.decodeObjectForKey("lastLocalUpdate") as? NSDate
            else {return nil }
        
        guard let dLastEnterpriseUpdate = decoder.decodeObjectForKey("lastEnterpriseUpdate") as? NSDate
            else {return nil }
        
        self.init()
        self.lastLocalUpdate = dLastLocalUpdate
        self.lastEnterpriseUpdate = dLastEnterpriseUpdate
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.lastLocalUpdate, forKey: "lastLocalUpdate")
        coder.encodeObject(self.lastEnterpriseUpdate, forKey: "lastEnterpriseUpdate")
    }
    
    
    
    
    
    
}