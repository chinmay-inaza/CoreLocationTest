//
//  ContentView.swift
//  Test
//
//  Created by Chinmay Atrawalkar on 21/10/22.
//

import SwiftUI
import CoreLocation

class LocationDataManager : NSObject {
    var locationManager = CLLocationManager()
    
    override init()
    {
        super.init()
        locationManager.delegate = self
        debugPrint(locationManager)
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.showsBackgroundLocationIndicator = true
      
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
         
   }
}

extension LocationDataManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        
        switch status {
        case .notDetermined:
            debugPrint("not determined")
        case .restricted:
            debugPrint("restricted")
        case .denied:
            debugPrint("denied")
        case .authorizedAlways:
            debugPrint("authorizedAlways")
        case .authorizedWhenInUse:
            debugPrint("authorizedWhenInUse")
        case .authorized:
            debugPrint("authorized")
        default:
            debugPrint("unknown")
        }
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        let coordinate = manager.location?.coordinate

        print("Latitude=\(coordinate?.latitude ?? 0) & Longitude=\(coordinate?.longitude ?? 0)")
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Track") {
                print("HI")
                _ = LocationDataManager()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
