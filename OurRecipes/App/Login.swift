//
//  Login.swift
//  OurRecipes
//
//  Created by Abílio Tinoco on 01/06/2021.
//


import Foundation
import SwiftUI

class Login {
    
    var name : String
    var password : String

    var lista : [Perfil] 
    var TestLabel : UILabel!
    
    init(p : Perfil) {
        
        perfis = PerfilData()
        dishData = DishData()
        
        name = p.name
        password = p.password
        lista = perfis.filter({ p.name.isEmpty && p.password.isEmpty ? false : $0.name == p.name && $0.password == p.password})
     
    }
    
    func Check() -> (Bool) {
        return !lista.isEmpty;
    }
    
    func isLoginValid (login : String) -> Bool {
    if login.count >= 3
    { return true } else
    { return false }
        
    }

    func isPasswordValid(password : String) -> Bool {
        if password.count >= 3
        { return true } else
        { return false }
    }
    
    func GiveId() -> Int {
        
        return lista[0].id
        
    }

}
