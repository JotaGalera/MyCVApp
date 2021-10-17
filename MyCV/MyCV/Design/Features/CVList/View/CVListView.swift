//
//  CVListView.swift
//  MyCV
//
//  Created by Galera, Javier on 12/10/21.
//

import SwiftUI

struct CVListView: View {
    @StateObject var cvListViewModel: CVListViewModel
    
    init(cvListViewModel: CVListViewModel) {
        _cvListViewModel = StateObject(wrappedValue: cvListViewModel)
    }
    
    let cellWidth = UIScreen.main.bounds.width/1.1
    let cellHeight = UIScreen.main.bounds.height/7
    
    var body: some View {
        NavigationView {
            List(cvListViewModel.cvList, id: \.id) { cv in
                CVCellListView(cv: cv)
                    .frame(width: cellWidth,
                           height: cellHeight)
                    .padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            .navigationBarTitle("CV List")
        }.onAppear{
            cvListViewModel.getCVList()
        }
    }
}

struct CVListView_Previews: PreviewProvider {    
    static var previews: some View {
        CVListViewConfigurator().configure()
    }
}
