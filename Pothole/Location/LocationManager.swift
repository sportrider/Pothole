//
//  LocationManager.swift
//  Pothole
//
//  Created by Gary Harris on 12/3/20.
//

import Foundation
import CoreLocation
import Combine

class CLLocationManagerPublicist: NSObject, CLLocationManagerCombineDelegate {
    let authorizationSubject = PassthroughSubject<CLAuthorizationStatus, Never>()
    let locationSubject = PassthroughSubject<[CLLocation], Never>()
    
    func authorizationPublisher() -> AnyPublisher<CLAuthorizationStatus, Never> {
        let manager = CLLocationManager()
        return Just(manager.authorizationStatus)
                .merge(with: authorizationSubject.compactMap { $0 }
                )
            .eraseToAnyPublisher()
    }
    
    func locationPublisher() -> AnyPublisher<[CLLocation], Never> {
        return locationSubject.eraseToAnyPublisher()
    }
    
    func locationManager(_: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationSubject.send(locations)
    }
    
    func locationManager(_: CLLocationManager, didFailWithError _: Error) {
        // TODO: publish errors
    }
    
    func locationManager(_: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        authorizationSubject.send(status)
    }
}
