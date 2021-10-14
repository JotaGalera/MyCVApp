//
//  CVCellListView.swift
//  MyCV
//
//  Created by Galera, Javier on 14/10/21.
//

import SwiftUI

struct CVCellListView: View {
    let cv: CVMock
    
    @State var favImage: Bool = true
    
    var body: some View {
        GeometryReader { proxy in
            HStack {
                if let userImage = cv.image {
                    Image(userImage)
                        .resizable()
                        .frame(width: proxy.size.width/3,
                               height: proxy.size.height)
                }else {
                    
                    Image(systemName: "person.fill")
                        .resizable()
                        .background(Color.gray)
                        .clipShape(Circle())
                        .frame(width: proxy.size.width/3,
                               height: proxy.size.height)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("\(cv.name) \(cv.lastName)")
                        .font(.title2)
                        .bold()
                    
                    Text(cv.career)
                        .font(.title3)
                    if let specialization = cv.specialization {
                        Text("(\(specialization))")
                            .font(.title3)
                    }
                    
                    if let tags = cv.tags {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(tags, id: \.self) { tag in
                                    Text(tag)
                                        .font(.title3)
                                        .foregroundColor(.white)
                                        .padding(7)
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(.purple)
                                        )
                                }
                            }
                        }
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
                            .frame(width: proxy.size.width/12, height: proxy.size.width/12)
                    } else {
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: proxy.size.width/12, height: proxy.size.width/12)
                    }
                })
            }
            .frame(width: proxy.size.width,
                    height: proxy.size.height)
        }
    }
}

struct CVCellListView_Previews: PreviewProvider {
    static var previews: some View {
        CVCellListView(cv: CVMock(name: "Mock",
                                  lastName: "Mock",
                                  dateOfBirth: "10/10/1989",
                                  career: "Programmer",
                                  experience: "",
                                  tags: ["Teeths", "Dentistry",
                                  "Mock","MockMock"]))
    }
}
