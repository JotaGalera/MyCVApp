//
//  CV.swift
//  MyCV
//
//  Created by Galera, Javier on 17/10/21.
//

import Foundation

struct CV: Identifiable {
    var id: UUID = UUID()
    
    var image: String?
    var name: String
    var lastName: String
    var dateOfBirth: String
    var career: String
    var specialization: String?
    var experience: String
    var tags: [String]?
}
