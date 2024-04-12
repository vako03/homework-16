//
//  ViewController.swift
//  homework 16
//
//  Created by vako on 12.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    let profile = ProfileView()
    
    let cellId = "developerCell"
    var tableView = UITableView()
    var sectionHeaders = [String]()
    var letterButtonsStackView = UIStackView()
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ#"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "iOS Squad"
        view.backgroundColor = .white
        sortDevelopers()
        setupTableView()
        setupLetterButtons()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileTapped))
        profile.addGestureRecognizer(tapGesture)
        profile.isUserInteractionEnabled = true
    }
    
    func sortDevelopers() {
        developers.sort { $0.fullName < $1.fullName }
        sectionHeaders = developers.reduce(into: [String]()) { result, developer in
            let firstLetter = String(developer.fullName.prefix(1)).uppercased()
            if !result.contains(firstLetter) {
                result.append(firstLetter)
            }
        }
    }
    
    func setupTableView() {
        view.addSubview(profile)
        profile.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profile.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  18),
            profile.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 18),
            profile.heightAnchor.constraint(equalToConstant: 72),
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(DeveloperCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ])
    }
    
    func setupLetterButtons() {
        letterButtonsStackView.axis = .vertical
        letterButtonsStackView.spacing = 0.8
        letterButtonsStackView.alignment = .trailing
        letterButtonsStackView.distribution = .fillEqually
        
        alphabet.forEach { letter in
            let button = UIButton(type: .system)
            button.setTitle(String(letter), for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 11)
            button.addTarget(self, action: #selector(scrollToSection(sender:)), for: .touchUpInside)
            letterButtonsStackView.addArrangedSubview(button)
        }
        
        view.addSubview(letterButtonsStackView)
        letterButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            letterButtonsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 160),
            letterButtonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1.5),
            letterButtonsStackView.leadingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 1.5),
            letterButtonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80)
        ])
    }
    
    @objc func scrollToSection(sender: UIButton) {
        guard let letter = sender.titleLabel?.text,
              let section = sectionHeaders.firstIndex(of: letter) else {
            return
        }
        let indexPath = IndexPath(row: 0, section: section)
        tableView.scrollToRow(at: indexPath, at: .top, animated: false)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let letter = sectionHeaders[indexPath.section]
        let developersWithLetter = developers.filter { $0.fullName.uppercased().hasPrefix(letter) }
        let developer = developersWithLetter[indexPath.row]
        
        let detailVC = DetailViewController()
        detailVC.developer = developer
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeaders.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaders[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let letter = sectionHeaders[section]
        return developers.filter { $0.fullName.uppercased().hasPrefix(letter) }.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! DeveloperCell
        
        let letter = sectionHeaders[indexPath.section]
        let developersWithLetter = developers.filter { $0.fullName.uppercased().hasPrefix(letter) }
        let developer = developersWithLetter[indexPath.row]
        
        cell.configure(with: developer)
        return cell
    }
    
    @objc func profileTapped() {
        let detailVC = DetailViewController()
        detailVC.developer = Developer(fullName: "ვაკო მეხაშიშვილი", imageName: "icon", gender: "male", age: 26, hobby: "travel")
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
