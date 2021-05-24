//
//  ContentView.swift
//  unit conveter
//
//  Created by kamal on 23/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink( destination: Temperature() ) {
                    Text("Temperature")
                }
                NavigationLink( destination: Length() ) {
                    Text("Length")
                }
                NavigationLink( destination: Time() ) {
                    Text("Time")
                }
                Text("Volume")
            }
            .navigationTitle("Unit conveter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
