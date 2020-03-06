//
//  Questions.swift
//  Tabbed App
//
//  Created by Apple on 2/23/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation


struct Country : Decodable {
    let name : String
    let capital : String
    let region : String
}

public struct Question {
    
    public var statement: String?
    public var isTrue: Bool?
    
    public init(statement: String, isTrue: Bool) {
        self.statement = statement
        self.isTrue = isTrue
    }
}
