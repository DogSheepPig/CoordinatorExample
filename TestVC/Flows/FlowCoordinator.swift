//
//  FlowCoordinator.swift
//  Evolve
//
//  Created by Artem Havriushov on 2/19/18.
//  Copyright © 2018 Evolve Biologix. All rights reserved.
//

import UIKit

protocol FlowCoordinator: class {
    
    // should be weak in realization
    var containerViewController: UIViewController? { get set }
    @discardableResult func createFlow() -> UIViewController
    
}

extension FlowCoordinator {
    
    var navigationController: UINavigationController? {
        return containerViewController as? UINavigationController
    }
    
}
