//
//  TermsPrivacyViewController.swift
//  Lesson11HW
//

//

import UIKit

class TermsPrivacyViewController: BaseViewController, UITextViewDelegate {
    
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var iAgree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        text.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        
        text.delegate = self
        iAgree.isEnabled = false
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let edge = scrollView.contentOffset.y + scrollView.frame.size.height
        if edge >= scrollView.contentSize.height{
            iAgree.isEnabled = true
        }
    }
}

