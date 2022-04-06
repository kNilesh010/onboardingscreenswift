//
//  ViewController.swift
//  Onboardingscreen
//
//  Created by Nilesh Kumar on 07/04/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if CheckNewUser.shared.isNewUser() {
            //show on boarding screen
            let vc = WelcomeViewController()
            vc.title = "Welcome"
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }

}

class CheckNewUser{
    
    static let shared = CheckNewUser()
    
    func isNewUser() -> Bool{
        return !UserDefaults.standard.bool(forKey: "user")
    }
    
    func isNotNewUser() {
        return UserDefaults.standard.set(true, forKey: "user")
    }
}
