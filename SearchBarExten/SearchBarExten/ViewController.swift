//
//  ViewController.swift
//  SearchBarExten
//
//  Created by yesway on 2017/5/25.
//  Copyright © 2017年 yesway. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var textFieldA: UITextField? = nil
    
    var textFieldB: UITextField? = nil
    
    var homeSearch: HomeSearchBar? = nil
    
    var pageSearch: PageSearchBar? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.textFieldA = UITextField()
//        let searchBarA = SearchBar(textField: self.textFieldA!, searchManager: SearchLogicHomeManager())
//        homeSearch = HomeSearchBar(searchBar: searchBarA, searchLogic: "我要最近的", owner: self)
//        view.addSubview(self.textFieldA!)
//        
//        self.textFieldB = UITextField()
//        let searchBarB = SearchBar(textField: self.textFieldB!, searchManager: SearchLogicPageManager())
//        pageSearch = PageSearchBar(searchBar: searchBarB, searchLogic: "我要评价最高的", owner: self)
//        view.addSubview(self.textFieldB!)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textFieldA?.frame = CGRect(x: 10, y: 10, width: 300, height: 50)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension ViewController: SearchBarDelegate {
    func responseResult(dict: Dictionary<String, Any>) {
        print(dict)
    }
}

