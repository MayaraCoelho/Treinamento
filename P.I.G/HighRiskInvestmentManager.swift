//
//  Manager.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 05/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class HighRiskInvestmentManager{
    
    func applyInHighRiskInvestment(pEnterprise:Enterprise, pValue:Double){
        
        if (AppData.sharedInstance.player.canRemoveFromBalance(pValue)){
        AppData.sharedInstance.player.removeFromBalance(pValue)
        
        //Checks if player does already have an investment in that Enterprise
        if (AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(pEnterprise)){
            let investment = AppData.sharedInstance.player.highRiskInvestmentForEnterprise(pEnterprise)!
            AppData.sharedInstance.player.removeHighRiskInvestmentForEnterprise(pEnterprise)
            investment.currentValue = investment.currentValue + pValue
            investment.startingValue = investment.startingValue + pValue
            AppData.sharedInstance.player.highRiskInvestments.append(investment)
        } else {
            let investment = HighRiskInvestment(pEnterpriseID: pEnterprise.id, pInvestedValue: pValue)
            AppData.sharedInstance.player.highRiskInvestments.append(investment)
        }
            
      }
    }
    
    
    func rescueFromHighRiskInvestment(pEnterprise:Enterprise){
        if (AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(pEnterprise)){
            let investment = AppData.sharedInstance.player.highRiskInvestmentForEnterprise(pEnterprise)!
            AppData.sharedInstance.player.addToBalance(investment.currentValue)
            AppData.sharedInstance.player.removeHighRiskInvestmentForEnterprise(pEnterprise)
        }
    }
    
    
    func rescueFromHighRiskInvestment(pEnterprise:Enterprise, pValue:Double){
        if (AppData.sharedInstance.player.doesHaveHighRiskInvestmentInEnterprise(pEnterprise)){
            let investment = AppData.sharedInstance.player.highRiskInvestmentForEnterprise(pEnterprise)!
            if (pValue <= investment.currentValue){
                AppData.sharedInstance.player.removeHighRiskInvestmentForEnterprise(pEnterprise)
                investment.currentValue = investment.currentValue - pValue
                investment.startingValue = investment.startingValue
                AppData.sharedInstance.player.highRiskInvestments.append(investment)
                AppData.sharedInstance.player.addToBalance(pValue)
            } else if (pValue == investment.currentValue){
                self.rescueFromHighRiskInvestment(pEnterprise, pValue: pValue)
            }
            
        }
        
    }
    

    
}