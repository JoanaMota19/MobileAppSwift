//
//  AppDelegate.swift
//  OurRecipes
//
//  Created by Abílio Tinoco on 08/06/2021.
//

import UIKit
import Firebase

class AppDelegate: NSObject,UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        perfis = PerfilData()
        dishData = DishData()
        
        return true
    }
}

