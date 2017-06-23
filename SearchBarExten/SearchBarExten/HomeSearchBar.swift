//
//  HomeSearchBar.swift
//  SearchBarExten
//
//  Created by yesway on 2017/5/25.
//  Copyright © 2017年 yesway. All rights reserved.
//

import UIKit

class HomeSearchBar: UIView {

    var textField: UITextField
    var searchBar: SearchBar
    
    init(searchBar: SearchBar, searchLovar: String, owner: Any?) {
        self.searchBar = searchBar
        self.textField = searchBar.textField
        self.textField.backgroundColor = UIColor.blue
        self.textField.textColor = UIColor.white
        self.textField.font = UIFont.boldSystemFont(ofSize: 12)
        searchBar.searchDelegate = owner as? SearchBarDelegate
        //searchBar.searchManager.searchLogic = searchLovar
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
