//
//  Questionaire.swift
//  Norris 25
//
//  Created by Joshua Van Niekerk on 08/05/2020.
//  Copyright © 2020 Josh-Dog101. All rights reserved.
//

import Foundation

class Questionaire {
    
    let title    : String
    let questions : [String]
    
    init(title: String, questions: [String]) {
        self.title     = title
        self.questions  = questions
    }
}
