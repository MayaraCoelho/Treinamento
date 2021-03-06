//
//  InvestmentNotMadeVC.swift
//  Wall Invest
//
//  Created by Henrique do Prado Linhares on 16/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class InvestmentNotMadeVC: UIViewController {
    
    @IBOutlet weak var enterpriseName: UILabel!
    @IBOutlet weak var enterpriseDescription: UITextView!
    @IBOutlet weak var enterpriseValueLabel: UILabel!
    @IBOutlet weak var investmentValueLabel: UILabel!
    @IBOutlet weak var investmentValueSlider: UISlider!
    @IBOutlet weak var investmentButton: UIButton!
    
    
    var enterprise:Enterprise
    var homeViewController:HighRiskInvestmentsVC

    init(pEnterprise:Enterprise, pHomeViewController:HighRiskInvestmentsVC) {
        self.enterprise = pEnterprise
        self.homeViewController = pHomeViewController
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.enterpriseName.text = self.enterprise.name
        self.enterpriseDescription.text = self.enterprise.descript
        self.enterpriseValueLabel.text = NSString(format: NSLocalizedString("stck", comment: "")+": %.2f",self.enterprise.stockValue) as String
        self.investmentValueLabel.text = NSLocalizedString("invest", comment: "")+" $ 0"
        self.investmentButton.enabled = false
        self.investmentValueSlider.value = 0
        investmentValueSlider.setThumbImage(UIImage(named: "sliderButton"), forState: UIControlState.Normal)
        
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        let deviceToken = delegate?.tabBarC
        deviceToken?.tabBarView.hidden = true
        
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        //If the player wants and have money to invest
        if ((AppData.sharedInstance.player.balance * Double(self.investmentValueSlider.value)) > 0){
            self.investmentButton.enabled = true
        } else {
            self.investmentButton.enabled = false
        }
        let value = (AppData.sharedInstance.player.balance * Double(self.investmentValueSlider.value))
        self.investmentValueLabel.text = NSString(format: NSLocalizedString("invest", comment: "")+" $ %.2f", value) as String
    }
    
    @IBAction func investButtonAct(sender: UIButton) {
        let investmentValue = (AppData.sharedInstance.player.balance * Double(self.investmentValueSlider.value))
        AppData.sharedInstance.highRiskinvestmentManager.applyInHighRiskInvestment(self.enterprise, pValue: investmentValue)
        self.closePopUpScreen()
       // PlayerDAO.sharedInstance.savePlayer()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonAct(sender: UIButton) {
     self.closePopUpScreen()
    }
    
    func closePopUpScreen(){
        self.homeViewController.enterpriseDetailsView.hidden = true
        self.homeViewController.blurView.hidden = true
        self.homeViewController.viewDidLoad()
        self.homeViewController.tableView.reloadData()
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
    
}
