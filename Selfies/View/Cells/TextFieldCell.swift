//
//  TextFieldCell.swift
//  Selfies
//
//  Created by Andy Nadal on 8/10/21.
//

import UIKit

final class TextFieldCell: UITableViewCell {
    static let id = "textFieldCell"
    
    var mainTableViewController: MainTableViewController!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureLayout()
    }
    
    lazy var textfield: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .alphabet
        textField.textContentType = .name
        textField.placeholder = "¡Escribe tu nombre!"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    /// Configures and lays out the view's children, using Auto Layout.
    private func configureLayout() {
        contentView.addSubview(textfield)
        let margins = contentView.layoutMarginsGuide
        let padding: CGFloat = 15.0
        
        NSLayoutConstraint.activate([
            textfield.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: padding),
            textfield.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: padding),
            textfield.firstBaselineAnchor.constraint(equalTo: margins.topAnchor, constant: padding * 1.75),
            margins.bottomAnchor.constraint(equalTo: textfield.lastBaselineAnchor, constant: padding)
        ])
    }
}

extension TextFieldCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // Needed for backspacing
        if string.isEmpty { return true }
        
        var allowedCharacters = CharacterSet.letters
        allowedCharacters.insert(" ")
        return string.rangeOfCharacter(from: allowedCharacters) != nil
    }
}
