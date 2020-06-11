//
//  WelcomeFlowCoordinator.swift
//  TestVC
//
//  Created by Richard Jang on 2020-06-11.
//  Copyright © 2020 DogSheep. All rights reserved.
//

import UIKit

struct WelcomeFlowCoordinatorBuilder {
    
    static func build(with configuration: WelcomeFlowConfiguration) -> FlowCoordinator {
        let coordinator = WelcomeFlowCoordinator(configuration: configuration)
        
        return coordinator
    }
    
}

struct WelcomeFlowConfiguration {
    
    let parent: EventNode
    
}

enum WelcomeFlowCoordinatorEvent: Event {
    
}

private class WelcomeFlowCoordinator: EventNode, FlowCoordinator {
    
    weak var containerViewController: UIViewController?
    
    // MARK: - Init
    
    init(configuration: WelcomeFlowConfiguration) {
        super.init(parent: configuration.parent)
        addHandler([.onRaise, .consumeEvent]) { [weak self] (event: WelcomeModelEvent) in
            self?.handle(event)
        }
    }
    
    // MARK: - Public methods
    
    func createFlow() -> UIViewController {
        let viewController = StoryboardScene.Welcome.WelcomeViewController.instantiate()
        let model = WelcomeModel(parent: self)
        viewController.viewModel = WelcomeViewModel(model)
        
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.title = "Welcome"
        containerViewController = navigationController
        
        return navigationController
    }
    
    // MARK: - Handlers
      
    func handle(_ event: WelcomeModelEvent) {
        switch event {
        case .acceptedTerms:
            showHello()
        }
    }
    
    func showHello() {
        let viewController = StoryboardScene.Welcome.HelloViewController.instantiate()
        let model = HelloModel(parent: self)
        viewController.viewModel = HelloViewModel(model)
        viewController.title = "Hello"
        containerViewController?.present(viewController, animated: true, completion: nil)
    }
}
