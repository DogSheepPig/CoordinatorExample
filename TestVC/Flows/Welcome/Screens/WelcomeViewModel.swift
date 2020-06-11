//
//  WelcomeViewModel.swift
//  TestVC
//
//  Created by Richard Jang on 2020-06-11.
//  Copyright © 2020 DogSheep. All rights reserved.
//

import Foundation

final class WelcomeViewModel {
    
    // MARK: - Properties

    private let model: WelcomeModel

    // MARK: - Init
    
    init(_ model: WelcomeModel) {
        self.model = model
    }
    
    func acceptTerms() {
        model.acceptedTerms = true
    }
}
