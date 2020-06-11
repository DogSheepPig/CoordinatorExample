//
//  WelcomeModel.swift
//  TestVC
//
//  Created by Richard Jang on 2020-06-11.
//  Copyright © 2020 DogSheep. All rights reserved.
//

import Foundation

enum WelcomeModelEvent: Event {
    case acceptedTerms
}


final class WelcomeModel: EventNode {
    var acceptedTerms = false {
        didSet {
            self.raise(event: WelcomeModelEvent.acceptedTerms)
        }
    }
}
