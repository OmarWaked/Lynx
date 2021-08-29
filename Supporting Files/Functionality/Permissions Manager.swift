//
//  PermissionsManager.swift
//  C4ME
//
//  Created by Omar Waked on 7/13/18.
//  Copyright © 2018 Omar Waked. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit
import UserNotifications

class permissionsManager {
    
    let locationManager = CLLocationManager()

    static let shared = PermissionsManager()
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void){
        completionHandler([.alert, .badge, .sound])
    }
    
    func requestWhenInUseLocation() {
        locationManager.requestWhenInUseAuthorization()
    }

    func getLocation(){
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()

        if CLLocationManager.locationServicesEnabled(){
            #if arch(i386) || arch(x86_64)
            //simulator
            #else
            switch(CLLocationManager.authorizationStatus()){
            case .authorizedAlways, .authorizedWhenInUse:
                print("Authorized Location.")
                let latitude: CLLocationDegrees = (locationManager.location?.coordinate.latitude)!
                let longitude: CLLocationDegrees = (locationManager.location?.coordinate.longitude)!
                let location = CLLocation(latitude: latitude, longitude: longitude) //changed!!!
                CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                    if error != nil {
                        return
                    }else if let country = placemarks?.first?.country, let city = placemarks?.first?.locality, let state = placemarks?.first?.administrativeArea  {
                        print("\(city),","\(state),","\(country)")
                    }else{
                        print("Not in the USA")
                    }
                })
                break
                
            case .notDetermined:
                print("Not determined Location.")
                break
            case .restricted:
                print("Restricted Location.")
                break
            case .denied:
                print("Denied Location.")
            }
            #endif
        }
    }

    
    func setUserDefaults(){
        if userDefaults.bool(forKey: "NOTIFICATIONS") == true {
            UIApplication.shared.registerForRemoteNotifications()
        }else{
            UIApplication.shared.unregisterForRemoteNotifications()
        }
    }
    
}

