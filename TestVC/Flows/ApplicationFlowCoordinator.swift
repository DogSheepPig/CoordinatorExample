//
//  ApplicationFlowCoordinator.swift
//  TestVC
//
//  Created by Richard Jang on 2020-06-11.
//  Copyright © 2020 DogSheep. All rights reserved.
//

import UIKit
final class ApplicationFlowCoordinator: EventNode {

   // MARK: - Properties
   private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
        super.init(parent: nil)
    }
    func execute(from app: UIApplication, with launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        presentWelcomeFlow()
    }
    
    private func presentWelcomeFlow() {
        let configuration = WelcomeFlowConfiguration(parent: self)
        let coordinator = WelcomeFlowCoordinatorBuilder.build(with: configuration)
        setWindowRootViewController(with: coordinator.createFlow())
    }
    
    private func setWindowRootViewController(with viewController: UIViewController) {
        func setRoot(_ root: UIViewController) {
            window.rootViewController = viewController
            window.makeKeyAndVisible()
        }
        
        // ATTENTION: HANDLING OF PRESENTED VIEWCONTROLLERs BEFORE CHANGING rootViewController
        
        // Need to dismiss presentedViewController from rootViewController if it exists before changing
        // rootViewController in UIWindow. If change rootViewController before dismiss of presentedViewController
        // appears memory leak - all presented views (or screens) are not removed from UIWindow hierarchy!!!
        
        if let root = window.rootViewController, let presentedViewController = root.presentedViewController {
            // If presentedViewController is currently dismissing, need to wait for it
            if presentedViewController.isBeingDismissed {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.33) {
                    setRoot(viewController)
                }
                
            } else {
                root.dismiss(animated: true) {
                    setRoot(viewController)
                }
            }
        } else {
            setRoot(viewController)
        }
    }
}
