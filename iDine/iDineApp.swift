//
//  iDineApp.swift
//  iDine
//
//  Created by Maulik Bhuptani on 23/06/21.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    @StateObject var favorite = Favorite()

    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(order).environmentObject(favorite)
        }
    }
}
