//
//  ColorBarViewController.swift
//  ColorBar
//
//  Created by Henrique do Prado Linhares on 23/10/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import UIKit

class ColorBarViewController: UIViewController {
    

    @IBOutlet weak var barView: UIView!

    @IBOutlet weak var viewWitdhConstraint: NSLayoutConstraint!

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewWitdhConstraint.constant = CGFloat(0)
        // Do any additional setup after loading the view.
    }
    
    func drawBar(pNumber:Float){
        if (pNumber > 1){
            barView.backgroundColor = AppUIColors().myGreenColor
            if (pNumber >= 2){
                self.viewWitdhConstraint.constant = CGFloat(200)
            } else {
                self.viewWitdhConstraint.constant = CGFloat((pNumber - 1) * 200)
            }
        } else if (pNumber < 1){
            let inversepNumber = 1 - pNumber
            barView.backgroundColor = AppUIColors().myRedColor
            self.viewWitdhConstraint.constant = CGFloat((inversepNumber * 200))
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

