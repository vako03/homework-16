//
//  DetailsVC.swift
//  homework 16
//
//  Created by vako on 12.04.24.
//

import UIKit

class DetailViewController: UIViewController {
    var developer: Developer?
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let hobbyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(genderLabel)
        view.addSubview(ageLabel)
        view.addSubview(hobbyLabel)
        
        let stackView = UIStackView(arrangedSubviews: [genderLabel, ageLabel, hobbyLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 95),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 28),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 73),
            stackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 35),
            stackView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        if let developer = developer {
            imageView.image = UIImage(named: developer.imageName)
            nameLabel.text =  developer.fullName
            genderLabel.text = "Gender:     " + developer.gender
            ageLabel.text = "Age:     " + String(developer.age)
            hobbyLabel.text = "Hobby:     " + developer.hobby
        }
    }
    
}
