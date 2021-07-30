//
//  OurRecipesApp.swift
//  OurRecipes
//
//  Created by Carlos Tinoco on 25/May/2021.
//

import SwiftUI


@main
struct OurRecipesApp: App {
   
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    var delegate
    var body: some Scene {
        
        WindowGroup {
          
            LoginView()
        }
    }
}
