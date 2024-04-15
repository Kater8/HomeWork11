//
//  ProfileViewController.swift
//  Lesson11HW
//

//

import UIKit

protocol ProfileViewControllerDelegate: AnyObject{
    func touchUpInsideEdit()
}

class ProfileViewController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var firsNameLabel: UILabel!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var edit: UIBarButtonItem!
    
    private var editMode = false
    private let maxnumber = 30
    
    
    weak var delegate: ProfileViewControllerDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        setupText()
        setupLabel()
    }
    
//    лічильник налаштування
    private func setupLabel(){
        firsNameLabel.text = "\(maxnumber)"
        lastNameLabel.text = "\(maxnumber)"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = textField.text ?? ""
        if newText.count > maxnumber{
            return false
        }
        if textField == firstName {
            firsNameLabel.text = "\(maxnumber - newText.count)"
            firsNameLabel.textColor = newText.count < maxnumber ? .green : .red
        } else if textField == lastName {
            lastNameLabel.text = "\(maxnumber - newText.count)"
            lastNameLabel.textColor = newText.count < maxnumber ? .green : .red
        }
        return true
      
    }
}
 

// MARK: - Private
private extension ProfileViewController {
    
    func setupActions() {
        updateRigthtBarButton()
    }
    
    func updateRigthtBarButton() {
        
        let title = editMode ? "Done" : "Edit"

        let barButton = UIBarButtonItem(
            title: title,
            style: .plain,
            target: self,
            action: #selector(changeModeButtonDidTap)
        )
        
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func changeModeButtonDidTap() {
        debugPrint("ProfileViewController -> changeModeButtonDidTap")
        
        
        editMode = !editMode
        updateRigthtBarButton()
        updateEditMode()
    }
    private func updateEditMode(){
        firstName.isUserInteractionEnabled = editMode
        lastName.isUserInteractionEnabled = editMode
        firsNameLabel.isHidden = !editMode
        lastNameLabel.isHidden = !editMode
        if editMode{
            firstName.becomeFirstResponder()
        } else{
            view.endEditing(true)
        }
    }
    private func setupText() {
        firstName.delegate = self
        lastName.delegate = self
    }
}

