//
//  CVListVMConfigurator.swift
//  MyCV
//
//  Created by Galera, Javier on 17/10/21.
//

import Foundation
import SwiftUI

class CVListViewConfigurator {
    func configure() -> CVListView {
        let dataSource = ApiDataSourceImplementation()
        let repository = CVRepositoryImplementation(dataSource: dataSource)
        let getCvListUseCase = GetCvListUseCaseImplementation(repository: repository)
        let cvListVM = CVListViewModel(getCvListUseCase: getCvListUseCase)
        
        return CVListView(cvListViewModel: cvListVM)
    }
}
