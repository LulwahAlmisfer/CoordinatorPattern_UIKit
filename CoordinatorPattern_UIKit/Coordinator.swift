//
//  Coordinator.swift
//  CoordinatorPattern_UIKit
//
//  Created by lulwah on 04/08/2023.
//
import UIKit

enum Event {
    case redVC
    case blueVC
}

protocol Coordinator {
    var navigationController: UINavigationController? {get set}
    
    func eventOccurred(with type: Event)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}


class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    func eventOccurred(with type: Event) {
        switch type {
        case .redVC:
            var vc: UIViewController & Coordinating = redVC()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
            break
        case .blueVC:
            var vc: UIViewController & Coordinating = blueVC()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
            break
        }
    }
    
    func start() {
        var vc: UIViewController & Coordinating = StartVC()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
}
