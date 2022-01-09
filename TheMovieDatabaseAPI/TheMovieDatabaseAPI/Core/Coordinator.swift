//
//  Coordinator.swift
//  TheMovieDatabaseAPI
//
//  Created by Ekrem TAŞKIRAN on 9.01.2022.
//

import UIKit

final class Coordinator {
    static let shared = Coordinator()

    func push(controller key: ControllerKey, animated: Bool = true) {
        guard let navController = UIApplication.shared.windows.first?.rootViewController as? UINavigationController,
              let controller = viewController(key) else { return }
        navController.pushViewController(controller, animated: animated)
    }

    func present(controller key: ControllerKey, animated: Bool = true) {
        guard let controller = viewController(key) else { return }
        UIApplication.shared.windows.first?.rootViewController?.present(controller, animated: animated)
    }

    private func viewController(_ controllerKey: ControllerKey, data: Any? = nil) -> UIViewController? {
        if let classType = kControllerMap[controllerKey.rawValue]?.classType as? UIViewController.Type {
            let controller = classType.init()
            controller.data = data
            return controller
        }
        return nil
    }
}

let kControllerMap: [String: (classType: AnyClass, title: String)] = [
    ControllerKey.mainVC.rawValue: (MainVC.self, "")
]


enum ControllerKey: String {
    case splashVC = "SplashVC"
    case mainVC = "MainVC"
}
