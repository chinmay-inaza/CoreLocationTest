//
//  TestApp.swift
//  Test
//
//  Created by Chinmay Atrawalkar on 21/10/22.
//

import SwiftUI

@main
struct TestApp: App {
    init(){
        _ = LocationDataManager()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
