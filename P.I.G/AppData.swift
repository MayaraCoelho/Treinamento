//
//  AppData.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class AppData{
    static let sharedInstance = AppData()
    
    var player:Player
    var enterprises:[Enterprise]
    var timer:Timer
    var highRiskinvestmentManager:HighRiskInvestmentManager
    var lowRiskInvestmentManager:LowRiskInvestmentManager
    var properties: [Property]
    var goals:[Goal]
    
    
    
    init(){
        self.player = Player()
        self.enterprises = EnterpriseProperties.init().enterprises
        self.timer = Timer()
        self.highRiskinvestmentManager = HighRiskInvestmentManager()
        self.lowRiskInvestmentManager = LowRiskInvestmentManager()
        self.properties = PropertyProperties.init().properties
        self.goals = GoalProperties.init().goals
    }
    
    
    func startNewGame(){
        self.player = Player()
    }

    
    func enterpriseByID(pID:Int)->Enterprise?{
        for e:Enterprise in self.enterprises{
            if (e.id == pID){
            return e
            }
        }
        return nil
    }
    
    
}