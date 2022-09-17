//
//  ScreenBViewController.swift
//  MVVM+Coordinator
//
//  Created by Yago De Moura Silva on 13/09/22.
//

import Foundation
import UIKit

class ScreenBViewController: UIViewController {

    private lazy var screenBView: ScreenBView = {
      let view = ScreenBView()
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(screenBView)
        makeConstraints()
        view.backgroundColor = .white
    }
    
    func makeConstraints() {
        screenBView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension ScreenBViewController: ScreenBViewDelegateProtocol {
    func didCall() {
        let goToScreenCViewController = ScreenCViewController()
          self.navigationController?.pushViewController(goToScreenCViewController, animated: true)
    }
}
