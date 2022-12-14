//
//  ScreenCView.swift
//  MVVM+Coordinator
//
//  Created by Yago De Moura Silva on 16/09/22.
//

import UIKit
import SnapKit

protocol ScreenCViewDelegateProtocol: AnyObject {
    func didCall()
}

class ScreenCView: UIView {
    
    var constants: Text? = Text()
    weak var delegate: ScreenCViewDelegateProtocol?
    
    private lazy var firstLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.backgroundColor = .white
        label.text = constants?.screenC
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var goToNextScreenButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( constants?.goToScreenALabelText, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(callController), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        buildHierarchy()
        makeConstraints()
}

    func makeConstraints() {
        firstLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(80)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        goToNextScreenButton.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    func buildHierarchy(){
        self.addSubview(firstLabel)
        self.addSubview(goToNextScreenButton)
    }
    @objc private func callController(){
        delegate?.didCall()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
