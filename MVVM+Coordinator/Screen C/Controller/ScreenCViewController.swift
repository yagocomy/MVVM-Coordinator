//
//  ScreenCViewController.swift
//  MVVM+Coordinator
//
//  Created by Yago De Moura Silva on 16/09/22.
//

import Foundation
import UIKit


class ScreenCViewController: UIViewController {

    private lazy var screenCView: ScreenCView = {
      let view = ScreenCView()
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(screenCView)
        makeConstraints()
        view.backgroundColor = .white
    }
    
    func makeConstraints() {
        screenCView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension ScreenCViewController: ScreenCViewDelegateProtocol {
    func didCall() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
