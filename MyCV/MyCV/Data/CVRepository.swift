//
//  CVRepository.swift
//  MyCV
//
//  Created by Galera, Javier on 17/10/21.
//

import Foundation

protocol CVRepository {
    func getCVList(onSuccess: @escaping ([CV])->Void, onFailure: @escaping (DomainError)->Void )
}

class CVRepositoryImplementation: CVRepository {
    let dataMock: [CV] = [
        CV(name: "Ben",
               lastName: "Mock",
               dateOfBirth: "09/27/1996",
               career: "Odontology",
               specialization: "Periodontist",
               experience: "6 months working on a private clinic",
               tags: ["Teeths", "Dentistry", "Mock", "MockMock"]),
        CV(name: "Clark",
               lastName: "Mock",
               dateOfBirth: "09/27/1996",
               career: "Nurse",
               experience: "No have")
    ]
    
    func getCVList(onSuccess: @escaping ([CV]) -> Void, onFailure: @escaping (DomainError) -> Void) {
        onSuccess(dataMock)
    }
}
