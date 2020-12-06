//
//  MapView.swift
//  Pothole
//
//  Created by Gary Harris on 12/3/20.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var location: CLLocation
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location.coordinate
        uiView.setRegion(region, animated: true)
        uiView.addAnnotation(annotation)
    }
    
    func processZoom(value: Double) {
        
        
        
        
        
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(location:  CLLocation(
                    latitude: 41.584179,
                    longitude: -74.417334))
    }
}


