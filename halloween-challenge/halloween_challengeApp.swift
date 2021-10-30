//
//  halloween_challengeApp.swift
//  halloween-challenge
//
//  Created by Maegan Wilson on 10/29/21.
//

import SwiftUI

@main
struct halloween_challengeApp: App {
    var userCart = Cart()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userCart)
        }
    }
}
