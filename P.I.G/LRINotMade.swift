//
//  InvestmentVC.swift
//  P.I.G
//
//  Created by Mayara Coelho on 11/9/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class LRINotMade: UIViewController {

    
   
    @IBOutlet weak var lowRiskInvestmentName: UILabel!
    
    @IBOutlet weak var amountInvestedValue: UILabel!
    
    @IBOutlet weak var investmentValue: UILabel!
    
    @IBOutlet weak var investButton: UIButton!
    
    @IBOutlet weak var investmentSlider: UISlider!
    

    
    var superViewController:LowRiskInvestmentsVC
    
    var lowRiskInvestment:LowRiskInvestment
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lowRiskInvestmentName.text = self.lowRiskInvestment.name
        self.amountInvestedValue.text = NSString(format:"$ %.2f",self.lowRiskInvestment.currentValue) as String
        self.investmentValue.text = NSString(format:"$ %.2f",0) as String
        // Do any additional setup after loading the view.
    }
    
    init(pSuperViewController:LowRiskInvestmentsVC, pLowRiskInvestment:LowRiskInvestment) {
        self.superViewController = pSuperViewController
        self.lowRiskInvestment = pLowRiskInvestment
        super.init(nibName: nil, bundle: nil)
    }
    
    @IBAction func investmentSliderChanged(sender: UISlider) {
        
        let value = (AppData.sharedInstance.player.balance * Double(self.investmentSlider.value))
        
       //If the player wants and have money to invest
        if (value > 0){
            self.investButton.enabled = true
        } else {
            self.investButton.enabled = false
        }
        
        self.investmentValue.text = NSString(format:"$ %.2f",value) as String
    
    }
    
    @IBAction func investButtonAct(sender: UIButton) {
        let value = (AppData.sharedInstance.player.balance * Double(self.investmentSlider.value))
        AppData.sharedInstance.investmentManager.applyInLowRiskInvestment(lowRiskInvestment.id, pValue: value)
        self.closePopView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func exitButtonAct(sender: UIButton) {
        self.closePopView()
    }
    
    func closePopView(){
        self.superViewController.blurView.hidden = true
        self.superViewController.popWindowView.hidden = true
        self.superViewController.viewDidLoad()
        self.superViewController.tableView.reloadData()
        self.view.removeFromSuperview()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
