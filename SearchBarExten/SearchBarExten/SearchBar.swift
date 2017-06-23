//
//  SearchBar.swift
//  SearchBarExten
//
//  Created by yesway on 2017/5/25.
//  Copyright © 2017年 yesway. All rights reserved.
//

import UIKit

protocol SearchBarDelegate {
    func responseResult(dict: Dictionary<String, Any>)
}

class SearchBar: NSObject, UITextFieldDelegate {

    let searchManager: SearchProtocol
    
    let textField: UITextField
    
    var searchDelegate: SearchBarDelegate?
    
    init(textField: UITextField, searchManager: SearchProtocol) {
        self.searchManager = searchManager
        self.textField = textField
        super.init()
        textField.addTarget(self, action: #selector(textfilsakjfeilf), for: .editingChanged)
        self.textField.delegate = self
    }
    
    func textfilsakjfeilf() {
        self.searchManager.startSearch(textFieldContent: self.textField.text!) { (dict) in
            
            let content = dict["key"] as! String
            let logic = dict["logic"] as! String
            
            let result = ["result": logic + content]
            
            self.searchDelegate?.responseResult(dict: result)
        }
    }
    
}

