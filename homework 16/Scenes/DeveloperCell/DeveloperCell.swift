//
//  DeveloperCell.swift
//  homework 16
//
//  Created by vako on 12.04.24.
//

import UIKit

class DeveloperCell: UITableViewCell {
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.tintColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(arrowImageView)
        
        NSLayoutConstraint.activate([
            fullNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            fullNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with developer: Developer) {
        let fullNameComponents = developer.fullName.components(separatedBy: " ")
        var formattedFullName = ""
        for component in fullNameComponents {
            formattedFullName += component.prefix(1).uppercased() + component.dropFirst() + " "
        }
        
        formattedFullName = String(formattedFullName.dropLast())
        fullNameLabel.text = formattedFullName
    }
}
