//
//  LocationProtocols.swift
//  Pothole
//
//  Created by Gary Harris on 12/3/20.
//

import Foundation
import CoreLocation
import Combine


protocol CLLocationManagerCombineDelegate: CLLocationManagerDelegate {
    func authorizationPublisher() -> AnyPublisher<CLAuthorizationStatus, Never>
    func locationPublisher() -> AnyPublisher<[CLLocation], Never>
}
