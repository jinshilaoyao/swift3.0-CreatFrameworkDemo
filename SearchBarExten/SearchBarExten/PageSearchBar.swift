//
//  PageSearchBar.swift
//  SearchBarExten
//
//  Created by yesway on 2017/5/26.
//  Copyright © 2017年 yesway. All rights reserved.
//

import UIKit

class PageSearchBar: UIView {

    var textField: UITextField
    var searchBar: SearchBar
    
    init(searchBar: SearchBar, searchLogic: String, owner: Any?) {
        self.searchBar = searchBar
        self.textField = searchBar.textField
        self.textField.backgroundColor = UIColor.red
        self.textField.textColor = UIColor.white
        self.textField.font = UIFont.boldSystemFont(ofSize: 16)
        searchBar.searchDelegate = owner as? SearchBarDelegate
        //searchBar.searchManager.searchLogic = searchLogic
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
