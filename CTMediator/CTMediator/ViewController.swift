//
//  ViewController.swift
//  CTMediator
//
//  Created by yesway on 2017/5/31.
//  Copyright © 2017年 yesway. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let str = "aaa://A/actionB?id=1234"
        let url = URL(string: str)
        let m = CTMediator()
        m.performAction(withUrl: url!) { (dict) in
            
        }
        

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

