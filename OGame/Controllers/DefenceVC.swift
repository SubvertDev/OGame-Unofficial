//
//  DefenceVC.swift
//  OGame
//
//  Created by Subvert on 13.07.2021.
//

import UIKit

class DefenceVC: UIViewController {
    
    let tableView = UITableView()
    let activityIndicator = UIActivityIndicatorView()
    let refreshControl = UIRefreshControl()

    var defencesCell: DefenceCell?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Defence"

        configureTableView()
        configureActivityIndicator()

        refresh()
    }

    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BuildingCell", bundle: nil), forCellReuseIdentifier: "BuildingCell")
        tableView.removeExtraCellLines()
        tableView.alpha = 0.5
        tableView.rowHeight = 88
        tableView.keyboardDismissMode = .onDrag

        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
    }

    func configureActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .large
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.widthAnchor.constraint(equalToConstant: 100),
            activityIndicator.heightAnchor.constraint(equalToConstant: 100)
        ])

        activityIndicator.startAnimating()
    }

    // MARK: - REFRESH DATA ON SHIPYARD VC
    func refresh() {
        OGame.shared.defences() { result in
            switch result {
            case .success(let defences):
                self.defencesCell = DefenceCell(with: defences)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.refreshControl.endRefreshing()
                    self.tableView.isUserInteractionEnabled = true
                    self.tableView.alpha = 1
                    self.activityIndicator.stopAnimating()
                }
            case .failure(let error):
                self.logoutAndShowError(error)
            }
        }
    }

    @objc func refreshTableView() {
        refresh()
    }
}

extension DefenceVC: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BuildingCell", for: indexPath) as! BuildingCell

        guard let defencesCell = self.defencesCell else { return UITableViewCell() }

        cell.delegate = self
        cell.amountTextField.delegate = self
        cell.setDefence(id: indexPath.row, defenceTechnologies: defencesCell.defenceTechnologies)

        return cell // FIXME: text field is not properly reused
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension DefenceVC: BuildingCellDelegate {
    func didTapButton(_ cell: BuildingCell, _ type: (Int, Int, String)) {
        tableView.isUserInteractionEnabled = false
        tableView.alpha = 0.5
        activityIndicator.startAnimating()
        
        var typeToBuild = type
        if cell.amountTextField.text == "" || cell.amountTextField.text == "0" {
            typeToBuild = (type.0, 1, type.2)
        } else {
            typeToBuild = (type.0, Int((cell.amountTextField.text)!)!, type.2)
        }

        OGame.shared.build(what: typeToBuild, id: 0) { result in
            switch result {
            case .success(_):
                self.refresh()
                NotificationCenter.default.post(name: Notification.Name("Build"), object: nil)
                
            case .failure(let error):
                self.logoutAndShowError(error)
            }
        }
    }
}
