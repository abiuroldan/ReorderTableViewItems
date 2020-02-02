//
//  ViewController.swift
//  Reordertableview
//
//  Created by Abiu Roldán on 29/01/20.
//  Copyright © 2020 Abiu Roldán. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let rootView = RootView()
    private let cellID = "cellID"
    
    private var array = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]
    
    override func loadView() {
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        rootView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        rootView.tableView.isEditing = true
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
        rootView.tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = array[sourceIndexPath.row]
        array.remove(at: sourceIndexPath.row)
        array.insert(item, at: destinationIndexPath.row)
        print("Array ", array)
        debugPrint("\(sourceIndexPath.row) => \(destinationIndexPath.row)")
        // To check for correctness enable: self.tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        cell.textLabel?.textColor = .black
        cell.backgroundColor = .white
        print("for index: ", indexPath.row ,cell.showsReorderControl)
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let imageView = cell.subviews.first(where: { $0.description.contains("Reorder") })?.subviews.first(where: { $0 is UIImageView }) as? UIImageView
        imageView?.tintColor = .green
        imageView?.image = UIImage(named: "menu")
        let size = cell.bounds.height * 0.5
        imageView?.frame.size.width = size
        imageView?.frame.size.height = size
    }
}
