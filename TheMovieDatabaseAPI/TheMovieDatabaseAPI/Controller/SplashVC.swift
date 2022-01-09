//
//  SplashVC.swift
//  TheMovieDatabaseAPI
//
//  Created by Ekrem TAŞKIRAN on 9.01.2022.
//

import UIKit
import Reachability

final class SplashVC: BaseVC {
    // MARK: - Properties
    private let reachability = try? Reachability()
    
    // MARK: - Override Functions
    override func setupUI() {
        super.setupUI()
        reachabilityCheck()
    }
    
    // MARK: - Private Functions
    private func reachabilityCheck() {
        reachability?.whenReachable = { reachability in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                Coordinator.shared.push(controller: .mainVC, animated: false)
            }
            print("Reachable")
        }
        reachability?.whenUnreachable = { [weak self] _ in
            self?.showAlert()
            print("Not Reachable")
        }

        do {
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    private func showAlert() {
        let alertController = UIAlertController(title: "No Internet",
                                                message: "Check yout internet connection",
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    
    deinit {
        reachability?.stopNotifier()
    }
}
