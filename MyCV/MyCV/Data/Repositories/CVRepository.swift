//
//  CVRepository.swift
//  MyCV
//
//  Created by Galera, Javier on 17/10/21.
//

import Foundation

protocol CVRepository {
    func getCVList(onSuccess: @escaping ([CV]) -> Void, onFailure: @escaping (DomainError) -> Void)
}

class CVRepositoryImplementation: CVRepository {
    let dataSource: ApiDataSource
    
    init(dataSource: ApiDataSource) {
        self.dataSource = dataSource
    }
    
    func getCVList(onSuccess: @escaping ([CV]) -> Void, onFailure: @escaping (DomainError) -> Void) {
        dataSource.getCvList(onSuccess: { data in
            onSuccess(data)
        }, onFailure: { error in
            onFailure(error)
        })
    }
}
