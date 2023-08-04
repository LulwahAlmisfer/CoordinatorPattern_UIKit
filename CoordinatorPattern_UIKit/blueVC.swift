//
//  blueVC.swift
//  CoordinatorPattern_UIKit
//
//  Created by lulwah on 04/08/2023.
//

import UIKit

class blueVC: UIViewController, Coordinating {
    var coordinator: Coordinator?
    let redButton  = customButton(color: .red, title: "red VC")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        configureButton()
    }
    func configureButton() {
        redButton.addTarget(self, action: #selector(blueButtonClicked), for: .touchUpInside)
        view.addSubview(redButton)
        

        NSLayoutConstraint.activate([
            redButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            redButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            redButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            redButton.heightAnchor.constraint(equalToConstant: 50)
 
        ])
    }
    @objc func blueButtonClicked(){
        coordinator?.eventOccurred(with: .redVC)
      }

}
