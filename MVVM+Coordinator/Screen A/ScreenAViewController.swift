//
//  ViewController.swift
//  MVVM+Coordinator
//
//  Created by Yago De Moura Silva on 12/09/22.
//

import UIKit

class ScreenAViewController: UIViewController {
    
    private lazy var screenAView: ScreenAView = {
      let view = ScreenAView()
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(screenAView)
        makeConstraints()
        view.backgroundColor = .yellow
    }
    
    func makeConstraints() {
        screenAView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension ScreenAViewController: ScreenAViewDelegateProtocol {
    func didCall() {
      let goToScreenBViewController = UINavigationController(rootViewController: ScreenBViewController())
        self.present(goToScreenBViewController, animated: true)
        
    }
}
