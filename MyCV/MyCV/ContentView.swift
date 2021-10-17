//
//  ContentView.swift
//  MyCV
//
//  Created by Galera, Javier on 12/10/21.
//

import SwiftUI

struct ContentView: View {
    let configurator = CVListViewConfigurator()
    
    var body: some View {
        configurator.configure()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
