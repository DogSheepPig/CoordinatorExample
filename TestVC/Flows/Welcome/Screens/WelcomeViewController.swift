//
//  WelcomeViewController.swift
//  TestVC
//
//  Created by Richard Jang on 2020-06-11.
//  Copyright © 2020 DogSheep. All rights reserved.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - Properties

    var viewModel: WelcomeViewModel!
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func accept(_ sender: Any) {
        viewModel.acceptTerms()
    }
}
