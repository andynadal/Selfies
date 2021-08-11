//
//  MainTableViewController.swift
//  Selfies
//
//  Created by Andy Nadal on 8/10/21.
//

import UIKit

final class MainTableViewController: UITableViewController {

    private var selfie: UIImage?
    private var name: String? { textField.textfield.text }
    
    private var firebase = FirebaseService()
    
    lazy var textField = TextFieldCell()
    lazy var selfieCell = SelfieCell()
    lazy var showChartsCell = ShowChartsCell()
    lazy var uploadCell = UploadSelfieCell()
    
    override func viewDidLoad() {
        firebase.tableView = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80.0
        
        navigationItem.title = "Selfies App"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(TextFieldCell.self, forCellReuseIdentifier: TextFieldCell.id)
        tableView.register(TextCell.self, forCellReuseIdentifier: ShowChartsCell.id)
        tableView.register(UploadSelfieCell.self, forCellReuseIdentifier: UploadSelfieCell.id)
        
        firebase.retrieveBackgroundColor()
        
        textField.mainTableViewController = self
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 4 }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return textField
        case 1:
            return selfieCell
        case 2:
            return showChartsCell
        case 3:
            return uploadCell
        default:
            debugLog("An invalid index path was provided to the TableView \(indexPath.row)", in: .mainTable)
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            let cameraController = UIImagePickerController()
            cameraController.sourceType = .camera
            cameraController.delegate = self
            cameraController.cameraDevice = .front
            present(cameraController, animated: true)
        case 2:
            navigationController?.pushViewController(ChartsTableViewController(), animated: true)
        case 3:
            firebase.uploadSelfie(with: name, using: selfie)
        default:
            return
        }
    }
   
}

extension MainTableViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let uiImage = info[.originalImage] as? UIImage {
            selfie = uiImage
            selfieCell.userTookPicture()
        }
        dismiss(animated: true)
    }
}
