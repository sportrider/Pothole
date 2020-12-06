//
//  Location.swift
//  Pothole
//
//  Created by Gary Harris on 12/3/20.
//

import Foundation
import CoreLocation
import Combine


final class CurrentLocation: ObservableObject {

    @Published var authorizationStatus = CLAuthorizationStatus.notDetermined
    @Published var coordinate: CLLocation?

    let manager: CLLocationManager
    let publicist: CLLocationManagerCombineDelegate

    var cancellables = [AnyCancellable]()
    
    init() {
        let manager = CLLocationManager()
        let publicist = CLLocationManagerPublicist()

        manager.delegate = publicist
        
        self.manager = manager
        self.publicist = publicist
        self.manager.requestAlwaysAuthorization()
        
        let authorizationPublisher = publicist.authorizationPublisher()
        authorizationPublisher
          .sink(receiveValue: beginUpdates)
          .store(in: &cancellables)
        
        authorizationPublisher
          .receive(on: DispatchQueue.main)
          .assign(to: &$authorizationStatus)
        
        let locationPublisher = publicist.locationPublisher()
        locationPublisher
            .flatMap(Publishers.Sequence.init(sequence:))
            .map { $0 as CLLocation? }
            .receive(on: DispatchQueue.main)
            .assign(to: &$coordinate)
    }
    
    func beginUpdates(_ authorizationStatus: CLAuthorizationStatus) {
        if authorizationStatus == .authorizedAlways || authorizationStatus == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
}

