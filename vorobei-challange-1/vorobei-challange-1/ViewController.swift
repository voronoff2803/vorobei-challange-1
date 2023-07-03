//
//  ViewController.swift
//  vorobei-challange-1
//
//  Created by Alexey Voronov on 03.07.2023.
//

import UIKit

class ViewController: UIViewController {
    let customView = CustomView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(customView)
        setupUI()
    }
    
    func setupUI() {
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            customView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            customView.heightAnchor.constraint(equalToConstant: 100),
            customView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}


class CustomView: UIView {
    let gradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.cornerRadius = 10
        return gradientLayer
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.addSublayer(gradientLayer)
        self.setupShadow()
    }
    
    func setupShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 12
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
