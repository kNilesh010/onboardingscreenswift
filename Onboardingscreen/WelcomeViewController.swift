//
//  WelcomeViewController.swift
//  WelcomeViewController
//
//  Created by Nilesh Kumar on 07/04/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let myView: UIView = {
        let myView = UIView()
        return myView
    }()
    
    let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
        view.backgroundColor = .systemBackground
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myView.frame = view.frame
        configureUI()
    }

    func configureUI(){
        scrollView.frame = myView.bounds
        myView.addSubview(scrollView)
        
        let titles = ["Welcome", "Location", "All Set"]
        for x in 0..<3{
            
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * myView.frame.size.width, y: 0, width: myView.frame.size.width, height: myView.frame.size.height))
            pageView.backgroundColor = .gray
            let title = UILabel(frame: CGRect(x: 10, y: 10, width: myView.frame.size.width - 20, height: 120))
            let image = UIImageView(frame: CGRect(x: 10, y: 10 + 120 + 10, width: myView.frame.size.width - 20, height: myView.frame.size.height - 130 - 60))
            let button = UIButton(frame: CGRect(x: 10, y: myView.frame.size.height - 60, width: myView.frame.size.width - 20, height: 50))
            scrollView.addSubview(pageView)
            pageView.addSubview(title)
            title.textAlignment = .center
            title.text = titles[x]
            title.font = .systemFont(ofSize: 28, weight: .bold)
            
            pageView.addSubview(image)
            image.contentMode = .scaleAspectFit
            image.image = UIImage(named: "welcome_\(x+1)")
            
            pageView.addSubview(button)
            button.setTitleColor(.white, for: .normal)
            button.tag = x + 1
            button.backgroundColor = .black
            button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
            button.setTitle("Welcome", for: .normal)
            if x == 2 {
                button.setTitle("Get Started", for: .normal)
            }
            
        }
        scrollView.contentSize = CGSize(width: 3 * myView.frame.size.width, height: 0)
        scrollView.isPagingEnabled = true
      
    }
    
    @objc func didTapButton(_ button: UIButton){
        guard button.tag < 3 else {
            CheckNewUser.shared.isNotNewUser()
            let vc = HomeViewViewController()
            vc.title = "Home"
            vc.modalPresentationStyle = .fullScreen
            present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
            return
        }
        scrollView.setContentOffset(CGPoint(x: myView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
     }
    
}
