//
//  CVListView.swift
//  MyCV
//
//  Created by Galera, Javier on 12/10/21.
//

import SwiftUI

struct CVMock: Identifiable {
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

struct CVListView: View {
    init() {}
    
    let dataMock: [CVMock] = [
        CVMock(name: "Ben",
               lastName: "Mock",
               dateOfBirth: "09/27/1996",
               career: "Odontology",
               specialization: "Periodontist",
               experience: "6 months working on a private clinic",
               tags: ["Teeths", "Dentistry", "Mock", "MockMock"]),
        CVMock(name: "Clark",
               lastName: "Mock",
               dateOfBirth: "09/27/1996",
               career: "Nurse",
               experience: "No have")
    ]
    
    let cellWidth = UIScreen.main.bounds.width/1.1
    let cellHeight = UIScreen.main.bounds.height/7
    
    var body: some View {
        NavigationView {
            
            List(dataMock) { cv in
                CVCellListView(cv: cv)
                    
                    .frame(width: cellWidth,
                           height: cellHeight)
                    .padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
            }
            
            .navigationBarTitle("CV List")
        }
    }
}

struct CVListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ZStack {
            CVListView()
        }
    }
}
