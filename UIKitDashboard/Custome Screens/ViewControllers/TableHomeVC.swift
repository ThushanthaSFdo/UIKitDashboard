//
//  TableHomeVC.swift
//  UIKitDashboard
//
//  Created by Thush-Fdo on 26/06/2024.
//

import UIKit

class TableHomeVC: UIViewController {
    
    private var tableView = UITableView(frame: .zero, style: .plain)
    private let cellID = "CellID"
    private var tableViewList: [TableViewList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        assignData()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Table View List"
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.backgroundColor = .systemBackground
        tableView.rowHeight = 60
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension TableHomeVC {
    func assignData() {
        tableViewList = [
            TableViewList(name: "Cell Value Update", viewController: UpdateTableCellVC()),
            TableViewList(name: "Collapsible Header TableView", viewController: CollapsibleTableVC()),
            TableViewList(name: "Collapsible Cell TableView", viewController: CollapsibleCellTableVC()),
            TableViewList(name: "Collapsible TableView with Custom HeaderView", viewController: CollapsibleTableHeaderVC()),
            TableViewList(name: "Insta Feed Replica", viewController: InstaFeedRepVC()),
            TableViewList(name: "With Custom Cells", viewController: WithCustomViewVC()),
            TableViewList(name: "Card View in Table", viewController: CardViewVC()),
            TableViewList(name: "Segmented TableView", viewController: SegmentedTableViewVC())
        ]
    }
}

extension TableHomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        cell?.textLabel?.text = tableViewList[indexPath.row].name
        cell?.textLabel?.numberOfLines = 0
        return cell!
    }
}

extension TableHomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(tableViewList[indexPath.row].viewController, animated: true)
    }
}

