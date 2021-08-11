//
//  FirebaseService.swift
//  Selfies
//
//  Created by Andy Nadal on 8/11/21.
//

import Firebase
import FirebaseStorage

final class FirebaseService {
    private var database: DatabaseReference?
    private var storage = Storage.storage().reference()
    
    weak var tableView: MainTableViewController!
    
    func retrieveBackgroundColor() {
        database = Database.database().reference()
        database?.observe(DataEventType.value) { [weak self] snapshot in
            if let color = snapshot.childSnapshot(forPath: "background").value as? String {
                print("Firebase Real Time DB background update", color)
                let uiColor = UIColor(color)
                self?.tableView.textField.backgroundColor = uiColor
                self?.tableView.selfieCell.backgroundColor = uiColor
                self?.tableView.showChartsCell.backgroundColor = uiColor
                self?.tableView.uploadCell.backgroundColor = uiColor
                self?.tableView.tableView.backgroundColor = uiColor
            }
        }
    }
    
    func uploadSelfie(with name: String?, using selfie: UIImage?) {
        guard let name = name, let selfie = selfie, let data = selfie.jpegData(compressionQuality: 0.5) else {
            let alert = UIAlertController(title: "Aviso", message: "Por favor escriba un nombre y tome una foto.", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default) { _ in
                alert.dismiss(animated: true)
            }
            alert.addAction(okButton)
            tableView.present(alert, animated: true)
            return
        }
        
        let selfieRef = storage.child("selfies/\(name)-\(UUID().uuidString).jpg")
        let metadata = StorageMetadata(dictionary: ["user": name, "timestamp": Date()])
        let uploadTask = selfieRef.putData(data, metadata: metadata) { _, error in
            if let error = error {
                debugLog("Something when wrong when trying to upload the image", in: .networking, with: error)
                return
            }
            print("Successfully uploaded the image")
        }
        uploadTask.resume()
    }
    
}
