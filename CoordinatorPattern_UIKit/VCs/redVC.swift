//
//  redVC.swift
//  CoordinatorPattern_UIKit
//
//  Created by lulwah on 04/08/2023.
//

import UIKit

class redVC: UIViewController, Coordinating {
    var coordinator: Coordinator?
    let blueButton  = customButton(color: .blue, title: "blue VC")


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureButton()
    }
    func configureButton() {
        blueButton.addTarget(self, action: #selector(blueButtonClicked), for: .touchUpInside)
        view.addSubview(blueButton)
        

        NSLayoutConstraint.activate([
            blueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            blueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            blueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            blueButton.heightAnchor.constraint(equalToConstant: 50)
 
        ])
    }
    @objc func blueButtonClicked(){
        coordinator?.eventOccurred(with: .blueVC)
      }
}
