//
//  ContactUsViewController.swift
//  Lesson11HW
//

//

import UIKit

class ContactUsViewController: BaseViewController, UITextViewDelegate {
    
    @IBOutlet weak var textV: UITextView!
    @IBOutlet weak var typeHere: UILabel!
    @IBOutlet weak var submit: UIButton!
    let limit = 320
    let minLimitSubmit = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textV.delegate = self
        updatePlaceholderVisibility()
        updateSubmit()
    }
    func textViewDidChange(_ textView: UITextView) {
        updatePlaceholderVisibility()
        LimitText()
        updateSubmit()
        
    }
    private func  updatePlaceholderVisibility() {
        typeHere.isHidden = !textV.text.isEmpty
    }
    private func LimitText() {
        if textV.text.count > limit {
            let index = textV.text.index(textV.text.startIndex, offsetBy: limit)
            textV.text = String(textV.text.prefix(upTo: index))
        }
    }
    private func updateSubmit() {
        submit.isEnabled = textV.text.count >= minLimitSubmit
    }
}




