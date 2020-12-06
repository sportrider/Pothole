//
//  Extensions.swift
//  Pothole
//
//  Created by Gary Harris on 12/3/20.
//

import Foundation
import CoreLocation

extension CLAuthorizationStatus: CustomStringConvertible {
    public var description: String {
    switch self {
        case .authorizedAlways:
            return "Always Authorized"
        case .authorizedWhenInUse:
            return "Authorized When In Use"
        case .denied:
            return "Denied"
        case .notDetermined:
            return "Not Determined"
        case .restricted:
            return "Restricted"
        @unknown default:
            return "🤷‍♂️"
        }
    }
}
