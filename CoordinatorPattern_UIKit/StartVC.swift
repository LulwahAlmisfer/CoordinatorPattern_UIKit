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

    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
    }
    
    func configureButtons() {
        redButton.addTarget(self, action: #selector(redButtonClicked), for: .touchUpInside)
        blueButton.addTarget(self, action: #selector(blueButtonClicked), for: .touchUpInside)
        view.addSubview(redButton)
        view.addSubview(blueButton)
        

        NSLayoutConstraint.activate([
            redButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
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
