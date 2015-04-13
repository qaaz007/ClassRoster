//
//  Person.swift
//  Class Roster
//
//  Created by Adnan Aziz on 4/11/15.
//  Copyright (c) 2015 Adnan Aziz. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var firstName : String
    var lastName : String
    var image : UIImage?
    
    func fullName() -> String {
        return self.firstName + " " + self.lastName
    }
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        super.init()
    }
    
}
