//
//  Investment.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 02/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation

class Investment:NSObject {
    
    var startingValue:Double
    var currentValue:Double
    
    init(pInvestedValue:Double){
        self.startingValue = pInvestedValue
        self.currentValue = pInvestedValue
    }
    
    

}