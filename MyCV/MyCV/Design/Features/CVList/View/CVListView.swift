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
}

struct CVListView: View {
    let dataMock: [CVMock] = [
        CVMock(name: "Ben",
               lastName: "Mock",
               dateOfBirth: "09/27/1996",
               career: "Odontology",
               specialization: "Periodontist",
               experience: "6 months working on a private clinic"),
        CVMock(name: "Clark",
               lastName: "Mock",
               dateOfBirth: "09/27/1996",
               career: "Nurse",
               experience: "No have")
    ]
    let imageWidth = UIScreen.main.bounds.width/3.5
    let imageHeight = UIScreen.main.bounds.height/7
    @State var favImage: Bool = true
    
    var body: some View {
        List(dataMock) { cv in
            HStack {
                if let userImage = cv.image {
                    Image(userImage)
                        .resizable()
                        .frame(width: imageWidth,
                               height: imageHeight,
                               alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        
                        
                }else {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: imageWidth,
                               height: imageHeight,
                               alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                }
                VStack(alignment: .leading) {
                    Text("\(cv.name) \(cv.lastName)")
                        .bold()
                    
                    Text(cv.career)
                    if let specialization = cv.specialization {
                        Text("(\(specialization))")
                    }
                }
                
                Spacer()
                
                Button(action: {
                    favImage.toggle()
                }, label: {
                    if favImage {
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 30, height: 30)
                    } else {
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                })
            }
        }
    }
}

struct CVListView_Previews: PreviewProvider {
    static var previews: some View {
        CVListView()
    }
}
