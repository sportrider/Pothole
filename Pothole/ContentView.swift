//
//  ContentView.swift
//  Pothole
//
//  Created by Gary Harris on 12/3/20.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @EnvironmentObject var currentLocation: CurrentLocation

    
    var body: some View {
        VStack {
            ZStack {
                MapView(location: currentLocation.coordinate ??
                        CLLocation(latitude: 41.584179, longitude: -74.417334))
                    .gesture(MagnificationGesture()
                        .onChanged { value in
                            
                          }
                        .onEnded { value in
                            
                        }
                    )
            }
            Text("Hello, world!")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
