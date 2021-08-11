//
//  UploadSelfieCell.swift
//  Selfies
//
//  Created by Andy Nadal on 8/11/21.
//

import UIKit

final class UploadSelfieCell: UITableViewCell {
    static let id = "uploadCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureLayout()
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = "¡Sube la selfie a la nube!"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBlue
        return label
    }()
    
    private func configureLayout() {
        contentView.addSubview(label)
        let margins = contentView.layoutMarginsGuide
        let padding: CGFloat = 15.0
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: padding),
            label.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: padding),
            label.firstBaselineAnchor.constraint(equalTo: margins.topAnchor, constant: padding * 1.75),
            margins.bottomAnchor.constraint(equalTo: label.lastBaselineAnchor, constant: padding)
        ])
    }
}
