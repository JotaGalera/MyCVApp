//
//  GetCvListUseCase.swift
//  MyCV
//
//  Created by Galera, Javier on 17/10/21.
//

import Foundation

protocol GetCvListUseCase {
    func execute(onSuccess: @escaping ([CV])->Void, onFailure: @escaping (DomainError)->Void)
}

class GetCvListUseCaseImplementation: GetCvListUseCase {
    let repository: CVRepository
    
    init(repository: CVRepository) {
        self.repository = repository
    }
    
    func execute(onSuccess: @escaping ([CV]) -> Void, onFailure: @escaping (DomainError) -> Void) {
        repository.getCVList(onSuccess: { cvs in
            onSuccess(cvs)
        }, onFailure: onFailure)
    }
}
