//
//  RootView.swift
//  Reordertableview
//
//  Created by Abiu Roldán on 29/01/20.
//  Copyright © 2020 Abiu Roldán. All rights reserved.
//

import UIKit

class RootView: UIView {
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
