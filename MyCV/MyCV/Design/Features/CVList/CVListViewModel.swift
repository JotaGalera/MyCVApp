//
//  CVListViewModel.swift
//  MyCV
//
//  Created by Galera, Javier on 17/10/21.
//

import Foundation

struct CVs {
    var cvs: [CV]
}

class CVListViewModel: ObservableObject {
    let getCvListUseCase: GetCvListUseCase
    
    @Published var cvList: [CV] = []
    @Published var anotherCV: CVs = CVs(cvs: [])
    
    init(getCvListUseCase: GetCvListUseCase) {
        self.getCvListUseCase = getCvListUseCase
    }
    
    func getCVList() {
        getCvListUseCase.execute(onSuccess: { cvList in
            self.cvList.append(contentsOf: cvList)
            self.anotherCV = CVs(cvs: cvList)
        }, onFailure: { error in
            print("Error getting CV list: \(error)")
        })
        print("cv listos")
    }
}
