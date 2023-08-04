//
//  StartVC.swift
//  CoordinatorPattern_UIKit
//
//  Created by lulwah on 04/08/2023.
//

import UIKit

class StartVC: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    let redButton  = customButton(color: .red, title: "red VC")
    let blueButton  = customButton(color: .blue, title: "blue VC")

    let label = UILabel(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
        configureButtons()
    }
    
    func configureLabel() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose where to navigate 🚗"
        label.textColor = .systemGray
        label.textAlignment = .center
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            label.heightAnchor.constraint(equalToConstant: 50),
         
 
        ])
    }
    
    
    func configureButtons() {
        redButton.addTarget(self, action: #selector(redButtonClicked), for: .touchUpInside)
        blueButton.addTarget(self, action: #selector(blueButtonClicked), for: .touchUpInside)
        view.addSubview(redButton)
        view.addSubview(blueButton)
        

        NSLayoutConstraint.activate([
            redButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            redButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            redButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            redButton.heightAnchor.constraint(equalToConstant: 50),
            
            blueButton.bottomAnchor.constraint(equalTo: redButton.topAnchor, constant: -30),
            blueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            blueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            blueButton.heightAnchor.constraint(equalToConstant: 50)
 
        ])
    }

    @objc func redButtonClicked(){
        coordinator?.eventOccurred(with: .redVC)
      }
    @objc func blueButtonClicked(){
        coordinator?.eventOccurred(with: .blueVC)
      }
}
